import 'package:built_collection/built_collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/domain/geo/geo.dart';
import 'package:places/domain/places/place/entity.dart';
import 'package:places/domain/places/place/model.dart';
import 'package:places/domain/places/place/photo.dart';
import 'package:places/domain/places/place/type.dart';

part 'response.freezed.dart';
part 'response.g.dart';

@freezed
class PlaceDto with _$PlaceDto {
  const factory PlaceDto({
    required int id,
    required String name,
    required double lat,
    required double lng,
    required String description,
    required String placeType,
    required List<String> urls,
  }) = _PlaceDto;

  const PlaceDto._();

  factory PlaceDto.fromJson(Map<String, dynamic> json) => _$PlaceDtoFromJson(json);

  factory PlaceDto.fromEntity(PlaceEntity placeEntity) {
    final place = placeEntity.place;

    return PlaceDto(
      id: placeEntity.id,
      name: place.name,
      lat: place.geo.lat,
      lng: place.geo.lng,
      description: place.details,
      placeType: place.type.name,
      urls: place.photos
          .map((photo) => photo.imageProvider.when(
                network: (url) => url,
              ))
          .toList(),
    );
  }

  PlaceEntity toEntity() {
    return PlaceEntity(
      id: id,
      place: Place(
        name: name,
        geo: Geo(lat: lat, lng: lng),
        details: description,
        type: PlaceType.fromString(placeType),
        photos: urls.map(PlacePhoto.fromUrl).toBuiltList(),
      ),
    );
  }
}
