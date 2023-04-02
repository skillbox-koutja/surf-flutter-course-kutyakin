import 'package:built_collection/built_collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/domain/geo/distance.dart';
import 'package:places/domain/geo/geo.dart';
import 'package:places/domain/places/place/entity.dart';
import 'package:places/domain/places/place/status.dart';

part 'model.freezed.dart';

typedef FavoritePlaces = BuiltList<FavoritePlace>;

final emptyFavoritePlaces = <FavoritePlace>[].toBuiltList();

@freezed
class FavoritePlace with _$FavoritePlace {
  bool get canDone => status.isPlanned;

  const factory FavoritePlace({
    required PlaceEntity placeEntity,
    required PlaceStatus status,
    required int priority,
  }) = _FavoritePlace;

  const FavoritePlace._();

  factory FavoritePlace.certainPlanned({
    required PlaceEntity placeEntity,
    required DateTime date,
    required int priority,
  }) {
    return FavoritePlace(
      placeEntity: placeEntity,
      status: CertainPlannedPlaceStatus(date: date),
      priority: priority,
    );
  }

  factory FavoritePlace.certainDone({
    required PlaceEntity placeEntity,
    required int priority,
    required DateTime date,
  }) {
    return FavoritePlace(
      placeEntity: placeEntity,
      status: CertainDonePlaceStatus(date: date),
      priority: priority,
    );
  }

  FavoritePlace done(DateTime date) {
    return copyWith(
      status: CertainDonePlaceStatus(date: date),
    );
  }

  Distance getDistance(Geo centerPoint) {
    return placeEntity.place.getDistance(centerPoint);
  }
}
