import 'dart:math' as math;

import 'package:places/domain/geo/geo.dart';

class Distance {
  final Geo checkPoint;
  final Geo centerPoint;

  /// Return value in double, unit: km
  double get value => _distanceInKm(
        checkPoint: checkPoint,
        centerPoint: centerPoint,
      );

  double get toMeters => value * 1000;

  const Distance({required this.checkPoint, required this.centerPoint});
}

const _d2r = math.pi / 180;

double _degreesToRadians(double degrees) {
  return degrees * _d2r;
}

const _earthRadiusKm = 6371.137;

double _distanceInKm({
  required Geo checkPoint,
  required Geo centerPoint,
}) {
  final dLat = _degreesToRadians(checkPoint.lat - centerPoint.lat);
  final dLon = _degreesToRadians(checkPoint.lng - centerPoint.lng);

  final lat1 = _degreesToRadians(centerPoint.lat);
  final lat2 = _degreesToRadians(checkPoint.lat);

  final a = math.sin(dLat / 2) * math.sin(dLat / 2) +
      math.sin(dLon / 2) * math.sin(dLon / 2) * math.cos(lat1) * math.cos(lat2);
  final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

  return _earthRadiusKm * c;
}
