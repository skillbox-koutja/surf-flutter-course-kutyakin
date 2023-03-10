import 'dart:math' as math;

import 'package:places/domain/geo/map_coordinates.dart';

class MapDistance {
  final MapCoordinates checkPoint;
  final MapCoordinates centerPoint;

  /// Return value in double, unit: km
  double get value {
    const ky = 40000 / 360;
    final kx = math.cos(math.pi * centerPoint.lat / 180.0) * ky;
    final dx = (centerPoint.long - checkPoint.long).abs() * kx;
    final dy = (centerPoint.lat - checkPoint.lat).abs() * ky;

    return math.sqrt(dx * dx + dy * dy);
  }

  double get toMeters => value * 1000;

  const MapDistance({required this.checkPoint, required this.centerPoint});
}
