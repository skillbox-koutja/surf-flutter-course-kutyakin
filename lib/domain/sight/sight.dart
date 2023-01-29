import 'package:places/domain/map/map_coordinates.dart';
import 'package:places/domain/map/map_distance.dart';
import 'package:places/domain/sight/sight_type.dart';

class Sight {
  final String name;
  final MapCoordinates coordinates;
  final String imageUrl;
  final String details;
  final SightType type;

  const Sight({
    required this.name,
    required this.coordinates,
    required this.imageUrl,
    required this.details,
    required this.type,
  });

  MapDistance getDistance(MapCoordinates centerPoint) {
    return MapDistance(
      centerPoint: centerPoint,
      checkPoint: coordinates,
    );
  }
}
