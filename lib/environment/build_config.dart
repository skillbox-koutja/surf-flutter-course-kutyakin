import 'package:places/domain/geo/geo.dart';

const _initialLocation = Geo(lat: 55.7522, lng: 37.6156);

class BuildConfig {
  final String envString;
  final String placesApiUrl;
  final Geo initialLocation;
  final double minDistance;
  final double maxDistance;
  final double radius;

  const BuildConfig({
    required this.envString,
    this.placesApiUrl = 'https://test-backend-flutter.surfstudio.ru/',
    this.initialLocation = _initialLocation,
    this.minDistance = 100.0,
    this.maxDistance = 10000.0,
    this.radius = 5000.0,
  });
}
