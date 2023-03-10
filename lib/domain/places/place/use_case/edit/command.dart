import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/domain/places/place/photo.dart';
import 'package:places/domain/places/place/type.dart';

part 'command.freezed.dart';

@freezed
class EditPlaceCommand with _$EditPlaceCommand {
  const factory EditPlaceCommand.setName(String name) = SetName;
  const factory EditPlaceCommand.setDetails(String details) = SetDetails;
  const factory EditPlaceCommand.setType(PlaceType type) = SetType;
  const factory EditPlaceCommand.setLat(double? lat) = SetLat;
  const factory EditPlaceCommand.setLng(double? lng) = SetLng;
  const factory EditPlaceCommand.pointOnMap({required double lat, required double lng}) = PointOnMap;
  const factory EditPlaceCommand.addPhoto(PlacePhoto photo) = AddPhoto;
  const factory EditPlaceCommand.removePhoto(PlacePhoto photo) = RemovePhoto;
}
