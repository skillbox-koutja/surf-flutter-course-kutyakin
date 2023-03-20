import 'package:elementary/elementary.dart';
import 'package:flutter/widgets.dart';
import 'package:places/domain/core/field/field.dart';
import 'package:places/domain/places/place/photo.dart';
import 'package:places/domain/places/place/type.dart';
import 'package:places/domain/places/place/use_case/edit/command.dart';
import 'package:places/domain/places/place/use_case/edit/model.dart';

class EditPlaceScreenModel extends ElementaryModel {
  late final ValueNotifier<EditablePlace> editablePlaceNotifier;
  late final ValueNotifier<FocusNode?> currentFocusNodeNotifier;

  EditablePlace get editablePlace => editablePlaceNotifier.value;
  FocusNode? get currentFocusNode => currentFocusNodeNotifier.value;
  set currentFocusNode(FocusNode? focusNode) {
    currentFocusNodeNotifier.value = focusNode;
  }

  EditPlaceScreenModel({
    required EditablePlace editablePlace,
    FocusNode? currentFocusNode,
  })  : editablePlaceNotifier = ValueNotifier(editablePlace),
        currentFocusNodeNotifier = ValueNotifier(currentFocusNode);

  void rename(String value) => dispatch(EditPlaceCommand.setName(value));

  void editDetails(String value) => dispatch(EditPlaceCommand.setDetails(value));

  void switchType(PlaceType value) => dispatch(EditPlaceCommand.setType(value));

  void editLat(double? value) => dispatch(EditPlaceCommand.setLat(value));

  void editLng(double? value) => dispatch(EditPlaceCommand.setLng(value));

  void addPhoto(PlacePhoto photo) => dispatch(EditPlaceCommand.addPhoto(photo));

  void removePhoto(PlacePhoto photo) => dispatch(EditPlaceCommand.removePhoto(photo));

  void pointOnMap({
    required double lat,
    required double lng,
  }) =>
      dispatch(EditPlaceCommand.pointOnMap(
        lat: lat,
        lng: lng,
      ));

  void dispatch(EditPlaceCommand command) {
    editablePlaceNotifier.value = editablePlaceNotifier.value.edit(command);
  }

  void save() {
    if (!editablePlaceNotifier.value.canSave) {
      return;
    }

    editablePlaceNotifier.value = editablePlaceNotifier.value.save();
  }

  void changeFieldFocus({
    required EditablePlaceFieldKeys key,
    required Field field,
    required FocusNode focusNode,
  }) {
    if (!field.isDirty) {
      editablePlaceNotifier.value = editablePlaceNotifier.value.touchField(key);
    }

    currentFocusNodeNotifier.value = !focusNode.hasFocus && currentFocusNode == focusNode ? null : focusNode;
  }

  void clearFocus() {
    currentFocusNodeNotifier.value = null;
  }
}
