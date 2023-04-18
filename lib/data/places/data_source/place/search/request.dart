import 'package:freezed_annotation/freezed_annotation.dart';

part 'request.freezed.dart';
part 'request.g.dart';

@freezed
class SearchPlaceRequest with _$SearchPlaceRequest {
  @JsonSerializable(includeIfNull: false)

  const factory SearchPlaceRequest({
    String? nameFilter,
    double? lat,
    double? lng,
    double? radius,
    List<String>? typeFilter,
  }) = _SearchPlaceRequest;

  const SearchPlaceRequest._();

  factory SearchPlaceRequest.fromJson(Map<String, dynamic> json) => _$SearchPlaceRequestFromJson(json);
}
