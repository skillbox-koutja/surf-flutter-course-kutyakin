// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchPlaceRequest _$SearchPlaceRequestFromJson(Map<String, dynamic> json) =>
    SearchPlaceRequest(
      nameFilter: json['nameFilter'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      radius: (json['radius'] as num?)?.toDouble(),
      typeFilter: (json['typeFilter'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$SearchPlaceRequestToJson(SearchPlaceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('nameFilter', instance.nameFilter);
  writeNotNull('lat', instance.lat);
  writeNotNull('lng', instance.lng);
  writeNotNull('radius', instance.radius);
  writeNotNull('typeFilter', instance.typeFilter);
  return val;
}

_$_SearchPlaceRequest _$$_SearchPlaceRequestFromJson(
        Map<String, dynamic> json) =>
    _$_SearchPlaceRequest(
      nameFilter: json['nameFilter'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      radius: (json['radius'] as num?)?.toDouble(),
      typeFilter: (json['typeFilter'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_SearchPlaceRequestToJson(
        _$_SearchPlaceRequest instance) =>
    <String, dynamic>{
      'nameFilter': instance.nameFilter,
      'lat': instance.lat,
      'lng': instance.lng,
      'radius': instance.radius,
      'typeFilter': instance.typeFilter,
    };
