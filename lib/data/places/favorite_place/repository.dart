import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:places/data/database.dart';
import 'package:places/data/places/favorite_place/converter.dart';
import 'package:places/domain/core/error/failure.dart';
import 'package:places/domain/geo/distance.dart';
import 'package:places/domain/geo/geo.dart';
import 'package:places/domain/places/favorite/model.dart';
import 'package:places/domain/places/favorite/repository/repository.dart';
import 'package:places/domain/places/place/entity.dart';
import 'package:places/domain/places/place/status.dart';
import 'package:places/domain/places/search/filters/filters.dart';

class FavoritePlaceRepositoryImpl implements FavoritePlaceRepository {
  final AppDb db;
  final FavoritePlacePersistenceModelConverter converter;

  const FavoritePlaceRepositoryImpl({
    required this.db,
    required this.converter,
  });

  @override
  Future<Either<Failure, FavoritePlaces>> getFavoritePlaces(SearchFilters searchFilters) async {
    final wishedPlaces = await _selectFavorites(PlaceStatusType.planned);

    return _getFavoritePlaces(
      favoritePlaces: wishedPlaces,
      searchFilters: searchFilters,
    );
  }

  @override
  Future<Either<Failure, FavoritePlace>> addToFavorites(FavoritePlace favoritePlace) async {
    await db.into(db.favoritePlaceTable).insertOnConflictUpdate(
          converter.toPersistenceModel(favoritePlace),
        );

    return Future.value(Right(favoritePlace));
  }

  @override
  Future<Either<Failure, void>> removeFromFavorites(FavoritePlace favoritePlace) async {
    await (db.delete(db.favoritePlaceTable)
          ..where(
            (place) => place.id.equals(favoritePlace.placeEntity.id),
          ))
        .go();

    return Future.value(const Right(null));
  }

  @override
  Future<Either<Failure, FavoritePlaces>> getVisitedPlaces(SearchFilters searchFilters) async {
    final visitedPlaces = await _selectFavorites(PlaceStatusType.done);

    return _getFavoritePlaces(
      favoritePlaces: visitedPlaces,
      searchFilters: searchFilters,
    );
  }

  @override
  Future<Either<Failure, void>> reorderFavorites({
    required int targetPriority,
    required FavoritePlace favoritePlace,
  }) {
    return _reorderFavorites(
      status: PlaceStatusType.planned,
      targetPriority: targetPriority,
      favoritePlace: favoritePlace,
    );
  }

  @override
  Future<Either<Failure, void>> reorderVisited({
    required int targetPriority,
    required FavoritePlace favoritePlace,
  }) {
    return _reorderFavorites(
      status: PlaceStatusType.done,
      targetPriority: targetPriority,
      favoritePlace: favoritePlace,
    );
  }

  static Future<FavoritePlaceRepositoryImpl> init(AppDb db) async {
    return FavoritePlaceRepositoryImpl(
      converter: const FavoritePlacePersistenceModelConverter(),
      db: db,
    );
  }

  Future<Either<Failure, void>> _reorderFavorites({
    required PlaceStatusType status,
    required int targetPriority,
    required FavoritePlace favoritePlace,
  }) async {
    await (db.update(db.favoritePlaceTable)
          ..where(
            (place) => place.priority.isBiggerOrEqualValue(targetPriority) & place.statusType.equalsValue(status),
          ))
        .write(
      FavoritePlaceTableCompanion.custom(
        priority: db.favoritePlaceTable.priority + const Constant(1),
      ),
    );
    await (db.update(db.favoritePlaceTable)
          ..where(
            (place) => place.id.equals(favoritePlace.placeEntity.id),
          ))
        .write(
      FavoritePlaceTableCompanion.custom(
        priority: Variable(targetPriority),
      ),
    );

    return Future.value(const Right(null));
  }

  Future<FavoritePlaces> _selectFavorites(PlaceStatusType statusType) async {
    final persistenceModels = await (db.select(db.favoritePlaceTable)
          ..where(
            (place) => place.statusType.equalsValue(statusType),
          )
          ..orderBy([
            (place) => OrderingTerm(expression: place.priority),
            (place) => OrderingTerm(expression: place.date, mode: OrderingMode.desc),
          ]))
        .get();

    return _toFavoritePlaces(persistenceModels);
  }

  FavoritePlaces _toFavoritePlaces(List<FavoritePlacePersistenceModel> persistenceModels) {
    return persistenceModels.map(converter.toFavoritePlace).toBuiltList();
  }
}

Future<Either<Failure, FavoritePlaces>> _getFavoritePlaces({
  required FavoritePlaces favoritePlaces,
  required SearchFilters searchFilters,
}) {
  final accept = _createFilter(
    searchFilters: searchFilters,
  );
  final filtered = _filterFavoritePlaces(favoritePlaces: favoritePlaces, accept: accept);

  return Future.value(Right(
    _sortByDistanceFavoritePlaces(
      favoritePlaces: filtered,
      geo: searchFilters.geoFilter.geo,
    ),
  ));
}

FavoritePlaces _filterFavoritePlaces({
  required FavoritePlaces favoritePlaces,
  required PlaceEntityFilter accept,
}) {
  return favoritePlaces.rebuild(
    (b) => b.removeWhere((favoritePlace) => !accept(favoritePlace.placeEntity)),
  );
}

FavoritePlaces _sortByDistanceFavoritePlaces({
  required FavoritePlaces favoritePlaces,
  required Geo geo,
}) {
  final distances = <int, Distance>{};

  return BuiltList(favoritePlaces.toList()
    ..sort((e1, e2) {
      final id1 = e1.placeEntity.id;
      final id2 = e2.placeEntity.id;
      final distance1 = distances[id1] ?? e1.getDistance(geo);
      final distance2 = distances[id2] ?? e2.getDistance(geo);

      distances[id1] = distance1;
      distances[id2] = distance2;

      return distance1.value.compareTo(distance2.value);
    }));
}

PlaceEntityFilter _createFilter({
  required SearchFilters searchFilters,
}) {
  final filters = <PlaceEntityFilter>[
    (placeEntity) {
      final value = placeEntity.place.getDistance(searchFilters.geoFilter.geo).toMeters;

      return value <= searchFilters.geoFilter.radius;
    },
  ];

  final selectedTypes = searchFilters.categorySelector.selected.map((element) => element.type).toBuiltSet();
  if (selectedTypes.isNotEmpty) {
    filters.add((placeEntity) => placeEntity.place.inTypes(selectedTypes));
  }

  return (placeEntity) {
    if (filters.isEmpty) return true;

    for (final filter in filters) {
      if (!filter(placeEntity)) {
        return false;
      }
    }

    return true;
  };
}
