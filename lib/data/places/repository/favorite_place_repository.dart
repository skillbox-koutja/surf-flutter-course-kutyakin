import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:places/domain/core/error/failure.dart';
import 'package:places/domain/geo/distance.dart';
import 'package:places/domain/geo/geo.dart';
import 'package:places/domain/places/favorite/model.dart';
import 'package:places/domain/places/favorite/repository/repository.dart';
import 'package:places/domain/places/place/entity.dart';
import 'package:places/domain/places/search/filters/filters.dart';

class FavoritePlaceRepositoryImpl implements FavoritePlaceRepository {
  FavoritePlaces favorites;

  FavoritePlaces get wishedPlaces => favorites.rebuild(
        (b) => b.where((favoritePlace) => !favoritePlace.status.isPlanned),
      );

  FavoritePlaces get visitedPlaces => favorites.rebuild(
        (b) => b.where((favoritePlace) => !favoritePlace.status.isDone),
      );

  FavoritePlaceRepositoryImpl({
    required this.favorites,
  });

  factory FavoritePlaceRepositoryImpl.create() {
    return FavoritePlaceRepositoryImpl(
      favorites: emptyFavoritePlaces,
    );
  }

  @override
  Future<Either<Failure, FavoritePlaces>> getFavoritePlaces(SearchFilters searchFilters) {
    return _getFavoritePlaces(
      favoritePlaces: wishedPlaces,
      searchFilters: searchFilters,
    );
  }

  @override
  Future<Either<Failure, FavoritePlaces>> addToFavorites(PlaceEntity placeEntity) {
    final favorite = FavoritePlace.certainPlanned(
      placeEntity: placeEntity,
      date: DateTime.now(),
    );
    favorites = favorites.rebuild((b) => b.insert(0, favorite));

    return Future.value(Right(wishedPlaces));
  }

  @override
  Future<Either<Failure, FavoritePlaces>> removeFromFavorites(FavoritePlace favoritePlace) {
    favorites = favorites.rebuild((b) => b.remove(favoritePlace));

    return Future.value(Right(wishedPlaces));
  }

  @override
  Future<Either<Failure, FavoritePlaces>> getVisitedPlaces(SearchFilters searchFilters) {
    return _getFavoritePlaces(
      favoritePlaces: visitedPlaces,
      searchFilters: searchFilters,
    );
  }

  @override
  Future<Either<Failure, FavoritePlaces>> addToVisited(FavoritePlace wished) {
    final visited = wished.done(DateTime.now());
    favorites = favorites.rebuild((b) => b
      ..remove(wished)
      ..insert(0, visited));

    return Future.value(Right(visitedPlaces));
  }

  @override
  Future<Either<Failure, FavoritePlaces>> removeFromVisited(FavoritePlace favoritePlace) {
    favorites = favorites.rebuild((b) => b.remove(favoritePlace));

    return Future.value(Right(visitedPlaces));
  }

  @override
  Future<Either<Failure, FavoritePlaces>> reorderFavorites({
    required int index,
    required FavoritePlace favoritePlace,
  }) {
    return _reorderFavorites(
      places: wishedPlaces,
      index: index,
      favoritePlace: favoritePlace,
    );
  }

  @override
  Future<Either<Failure, FavoritePlaces>> reorderVisited({
    required int index,
    required FavoritePlace favoritePlace,
  }) {
    return _reorderFavorites(
      places: visitedPlaces,
      index: index,
      favoritePlace: favoritePlace,
    );
  }

  Future<Either<Failure, FavoritePlaces>> _reorderFavorites({
    required FavoritePlaces places,
    required int index,
    required FavoritePlace favoritePlace,
  }) {
    final reordered = _reorder(
      favoritePlaces: places,
      index: index,
      favoritePlace: favoritePlace,
    );
    for (final place in reordered) {
      favorites = favorites.rebuild((b) => b.remove(place));
    }
    favorites = favorites.rebuild((b) => b.addAll(reordered));

    return Future.value(Right(reordered));
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

FavoritePlaces _reorder({
  required FavoritePlaces favoritePlaces,
  required int index,
  required FavoritePlace favoritePlace,
}) {
  return favoritePlaces.rebuild((b) => b
    ..remove(favoritePlace)
    ..insert(index, favoritePlace));
}
