import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/domain/map/map_coordinates.dart';
import 'package:places/domain/map/map_distance.dart';
import 'package:places/domain/sight/sight_photo.dart';
import 'package:places/domain/sight/sight_type.dart';

part 'sight.freezed.dart';

@freezed
class Sight with _$Sight {
  String get imageUrl => photos.isEmpty ? '' : photos.first.imageUrl;

  const factory Sight({
    required String name,
    required MapCoordinates coordinates,
    required String details,
    required SightType type,
    required List<SightPhoto> photos,
  }) = _Sight;

  const Sight._();

  MapDistance getDistance(MapCoordinates centerPoint) {
    return MapDistance(
      centerPoint: centerPoint,
      checkPoint: coordinates,
    );
  }
}
