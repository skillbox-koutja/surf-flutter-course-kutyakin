import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:places/domain/core/error/failure.dart';
import 'package:places/domain/geo/geo.dart';

class DeviceLocationDataSource {
  Future<Either<Failure, Geo>> getCurrentLocation() async {
    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) return left(ServiceFailure());

      final position = await Geolocator.getCurrentPosition();

      return right(Geo(lat: position.latitude, lng: position.longitude));
    } on Exception {
      return left(ServiceFailure());
    }
  }

  Stream<Geo> subscribePositionStream() {
    const locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    return Geolocator.getPositionStream(locationSettings: locationSettings).map(
      (position) => Geo(lat: position.latitude, lng: position.longitude),
    );
  }

  Future<bool> checkPermissions() async {
    var permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return false;
      }
    }

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      return true;
    }

    return false;
  }
}
