import 'package:places/domain/sight/sight_type.dart';

class EditableSight {
  String name = '';
  String imageUrl = 'https://picsum.photos/300/400';
  String details = '';

  double? lat;
  double? long;

  SightType type = SightType.none;

  bool get isValid => isValidName && isValidImageUrl && isValidDetails && isValidType && isValidLat && isValidLong;

  bool get isValidName => name.isNotEmpty;
  bool get isValidImageUrl => imageUrl.isNotEmpty;
  bool get isValidDetails => details.isNotEmpty;
  bool get isValidLat => lat != null;
  bool get isValidLong => long != null;
  bool get isValidType => !type.isNone();

  @override
  String toString() => 'EditableSight('
      'name: $name, '
      'imageUrl: $imageUrl, '
      'details: $details, '
      'lat: $lat, '
      'long: $long, '
      'type: $type, '
      ')';

  EditableSight copyWith({
    String? name,
    String? imageUrl,
    String? details,
    SightType? type,
  }) {
    final copy = EditableSight()
      ..name = name ?? this.name
      ..imageUrl = imageUrl ?? this.imageUrl
      ..details = details ?? this.details
      ..lat = lat
      ..long = long
      ..type = type ?? this.type;

    return copy;
  }

  EditableSight changeLatLong({
    double? lat,
    double? long,
  }) {
    final copy = EditableSight()
      ..name = name
      ..imageUrl = imageUrl
      ..details = details
      ..lat = lat
      ..long = long
      ..type = type;

    return copy;
  }
}
