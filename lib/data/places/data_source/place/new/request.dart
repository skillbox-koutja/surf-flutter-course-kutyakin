import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/domain/places/place/model.dart';

part 'request.freezed.dart';
part 'request.g.dart';

@freezed
class NewPlaceRequest with _$NewPlaceRequest {
  const factory NewPlaceRequest({
    required String name,
    required double lat,
    required double lng,
    required String description,
    required String placeType,
    required List<String> urls,
  }) = _NewPlaceRequest;

  const NewPlaceRequest._();

  factory NewPlaceRequest.fromJson(Map<String, dynamic> json) => _$NewPlaceRequestFromJson(json);

  factory NewPlaceRequest.fromPlace(Place place) {
    return NewPlaceRequest(
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
}
