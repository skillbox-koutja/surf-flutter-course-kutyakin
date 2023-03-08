// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchPlaceDto _$$_SearchPlaceDtoFromJson(Map<String, dynamic> json) =>
    _$_SearchPlaceDto(
      id: json['id'] as int,
      name: json['name'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      description: json['description'] as String,
      placeType: json['placeType'] as String,
      urls: (json['urls'] as List<dynamic>).map((e) => e as String).toList(),
      distance: (json['distance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_SearchPlaceDtoToJson(_$_SearchPlaceDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lat': instance.lat,
      'lng': instance.lng,
      'description': instance.description,
      'placeType': instance.placeType,
      'urls': instance.urls,
      'distance': instance.distance,
    };
