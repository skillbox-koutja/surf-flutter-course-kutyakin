// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewPlaceRequest _$$_NewPlaceRequestFromJson(Map<String, dynamic> json) =>
    _$_NewPlaceRequest(
      name: json['name'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      description: json['description'] as String,
      placeType: json['placeType'] as String,
      urls: (json['urls'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_NewPlaceRequestToJson(_$_NewPlaceRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'lat': instance.lat,
      'lng': instance.lng,
      'description': instance.description,
      'placeType': instance.placeType,
      'urls': instance.urls,
    };
