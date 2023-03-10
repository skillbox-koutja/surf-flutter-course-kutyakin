import 'package:built_collection/built_collection.dart';
import 'package:places/domain/places/place/model.dart';

class PlaceEntity {
  final int id;
  final Place place;

  const PlaceEntity({
    required this.id,
    required this.place,
  });
}

typedef PlaceEntities = BuiltList<PlaceEntity>;

typedef PlaceEntityFilter = bool Function(PlaceEntity placeEntity);
