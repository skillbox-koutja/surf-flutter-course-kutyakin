import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/domain/sight/sight_photo.dart';
import 'package:places/domain/sight/sight_type.dart';

part 'event.freezed.dart';

@freezed
class EditSightModelEvent with _$EditSightModelEvent {
  const factory EditSightModelEvent.setName(String name) = SetName;
  const factory EditSightModelEvent.setDetails(String details) = SetDetails;
  const factory EditSightModelEvent.setType(SightType type) = SetType;
  const factory EditSightModelEvent.setLat(double? lat) = SetLat;
  const factory EditSightModelEvent.setLong(double? long) = SetLong;
  const factory EditSightModelEvent.pointOnMap({required double lat, required double long}) = PointOnMap;
  const factory EditSightModelEvent.addPhoto(SightPhoto photo) = AddPhoto;
  const factory EditSightModelEvent.removePhoto(SightPhoto photo) = RemovePhoto;
}
