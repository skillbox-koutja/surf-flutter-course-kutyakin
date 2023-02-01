import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/domain/sight/sight_type.dart';

part 'event.freezed.dart';

@freezed
class EditSightModelEvent with _$EditSightModelEvent {
  const factory EditSightModelEvent.setName(String name) = EditSightModelSetName;
  const factory EditSightModelEvent.setDetails(String details) = EditSightModelSetDetails;
  const factory EditSightModelEvent.setType(SightType type) = EditSightModelSetType;
  const factory EditSightModelEvent.setLat(double? lat) = EditSightModelSetLat;
  const factory EditSightModelEvent.setLong(double? long) = EditSightModelSetLong;
  const factory EditSightModelEvent.pointOnMap({required double lat, required double long}) = EditSightModelPointOnMap;
}
