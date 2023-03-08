import 'package:freezed_annotation/freezed_annotation.dart';

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

  factory PlaceDto.fromJson(Map<String, dynamic> json) => _$PlaceDtoFromJson(json);
}
