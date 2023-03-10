import 'package:built_collection/built_collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/domain/geo/distance.dart';
import 'package:places/domain/geo/geo.dart';
import 'package:places/domain/places/place/photo.dart';
import 'package:places/domain/places/place/type.dart';

part 'model.freezed.dart';

@freezed
class Place with _$Place {
  PlacePhoto get photo => photos.first;

  const factory Place({
    required String name,
    required Geo geo,
    required String details,
    required PlaceType type,
    required BuiltList<PlacePhoto> photos,
  }) = _Place;

  const Place._();

  Distance getDistance(Geo centerPoint) {
    return Distance(
      centerPoint: centerPoint,
      checkPoint: geo,
    );
  }

  bool inTypes(BuiltSet<PlaceType> types) {
    return types.contains(type);
  }
}
