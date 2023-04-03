// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceStatus _$PlaceStatusFromJson(Map<String, dynamic> json) => PlaceStatus(
      type: $enumDecode(_$PlaceStatusTypeEnumMap, json['type']),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$PlaceStatusToJson(PlaceStatus instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'type': _$PlaceStatusTypeEnumMap[instance.type]!,
    };

const _$PlaceStatusTypeEnumMap = {
  PlaceStatusType.planned: 'planned',
  PlaceStatusType.done: 'done',
};
