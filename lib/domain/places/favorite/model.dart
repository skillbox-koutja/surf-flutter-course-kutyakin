import 'package:built_collection/built_collection.dart';
import 'package:places/domain/geo/distance.dart';
import 'package:places/domain/geo/geo.dart';
import 'package:places/domain/places/place/entity.dart';
import 'package:places/domain/places/place/status.dart';

typedef FavoritePlaces = BuiltList<FavoritePlace>;

final emptyFavoritePlaces = <FavoritePlace>[].toBuiltList();

class FavoritePlace {
  final PlaceEntity placeEntity;
  final PlaceStatus status;

  bool get canDone => status.isPlanned;

  const FavoritePlace._({
    required this.placeEntity,
    required this.status,
  });

  factory FavoritePlace.certainPlanned({
    required PlaceEntity placeEntity,
    required DateTime date,
  }) {
    return FavoritePlace._(
      placeEntity: placeEntity,
      status: CertainPlannedPlaceStatus(date: date),
    );
  }

  factory FavoritePlace.certainDone({
    required PlaceEntity placeEntity,
    required DateTime date,
  }) {
    return FavoritePlace._(
      placeEntity: placeEntity,
      status: CertainDonePlaceStatus(date: date),
    );
  }

  FavoritePlace done(DateTime date) {
    return FavoritePlace.certainDone(
      placeEntity: placeEntity,
      date: date,
    );
  }

  Distance getDistance(Geo centerPoint) {
    return placeEntity.place.getDistance(centerPoint);
  }
}
