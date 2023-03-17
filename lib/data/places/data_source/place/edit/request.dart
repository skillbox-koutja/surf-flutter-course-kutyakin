import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/domain/places/place/use_case/edit/model.dart';

part 'request.freezed.dart';
part 'request.g.dart';

@freezed
class EditPlaceRequest with _$EditPlaceRequest {
  @JsonSerializable(includeIfNull: false)

  const factory EditPlaceRequest({
    String? name,
    double? lat,
    double? lng,
    String? description,
    String? placeType,
    List<String>? urls,
  }) = _EditPlaceRequest;

  const EditPlaceRequest._();

  factory EditPlaceRequest.fromJson(Map<String, dynamic> json) => _$EditPlaceRequestFromJson(json);

  factory EditPlaceRequest.fromPlace(EditablePlace place) {
    return EditPlaceRequest(
      name: place.name.isDirty ? place.name.value : null,
      lat: place.lat.isDirty ? place.lat.value : null,
      lng: place.lng.isDirty ? place.lng.value : null,
      description: place.details.isDirty ? place.details.value : null,
      placeType: place.type.isDirty ? place.type.value.name : null,
      urls: place.photos.isDirty
          ? place.photos.value
          .map((photo) => photo.imageProvider.when(
        network: (url) => url,
      ))
          .toList()
          : null,
    );
  }
}
