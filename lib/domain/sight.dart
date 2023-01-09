class Sight {
  final String name;
  final MapCoordinates coordinates;
  final String imageUrl;
  final String details;
  final String type;

  Sight({
    required this.name,
    required this.coordinates,
    required this.imageUrl,
    required this.details,
    required this.type,
  });
}

class MapCoordinates {
  final double lat;
  final double long;

  MapCoordinates({required this.lat, required this.long});
}
