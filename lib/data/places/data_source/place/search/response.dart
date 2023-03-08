import 'package:freezed_annotation/freezed_annotation.dart';

part 'response.freezed.dart';
part 'response.g.dart';

@freezed
class SearchPlaceDto with _$SearchPlaceDto {
  const factory SearchPlaceDto({
    required int id,
    required String name,
    required double lat,
    required double lng,
    required String description,
    required String placeType,
    required List<String> urls,
    double? distance,
  }) = _SearchPlaceDto;

  factory SearchPlaceDto.fromJson(Map<String, dynamic> json) => _$SearchPlaceDtoFromJson(json);
}
