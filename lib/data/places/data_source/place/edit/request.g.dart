// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditPlaceRequest _$EditPlaceRequestFromJson(Map<String, dynamic> json) =>
    EditPlaceRequest(
      name: json['name'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      description: json['description'] as String?,
      placeType: json['placeType'] as String?,
      urls: (json['urls'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$EditPlaceRequestToJson(EditPlaceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('lat', instance.lat);
  writeNotNull('lng', instance.lng);
  writeNotNull('description', instance.description);
  writeNotNull('placeType', instance.placeType);
  writeNotNull('urls', instance.urls);
  return val;
}

_$_EditPlaceRequest _$$_EditPlaceRequestFromJson(Map<String, dynamic> json) =>
    _$_EditPlaceRequest(
      name: json['name'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      description: json['description'] as String?,
      placeType: json['placeType'] as String?,
      urls: (json['urls'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_EditPlaceRequestToJson(_$_EditPlaceRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'lat': instance.lat,
      'lng': instance.lng,
      'description': instance.description,
      'placeType': instance.placeType,
      'urls': instance.urls,
    };
