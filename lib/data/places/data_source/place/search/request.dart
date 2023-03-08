import 'package:freezed_annotation/freezed_annotation.dart';

part 'request.freezed.dart';
part 'request.g.dart';

@JsonSerializable(includeIfNull: false)
@freezed
class SearchPlaceRequest with _$SearchPlaceRequest {
  const factory SearchPlaceRequest({
    String? nameFilter,
    double? lat,
    double? lng,
    double? radius,
    List<String>? typeFilter,
  }) = _SearchPlaceRequest;

  factory SearchPlaceRequest.fromJson(Map<String, dynamic> json) => _$SearchPlaceRequestFromJson(json);
}
