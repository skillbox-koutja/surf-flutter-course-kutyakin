import 'package:flutter/widgets.dart';
import 'package:places/domain/core/field/field.dart';
import 'package:places/domain/places/place/photo.dart';
import 'package:places/domain/places/place/type.dart';
import 'package:places/domain/places/place/use_case/edit/command.dart';
import 'package:places/domain/places/place/use_case/edit/model.dart';

typedef NextFieldHandler = void Function(FocusNode currentFocusNode);

typedef FocusChangeHandler = void Function({
  required EditablePlaceFieldKeys key,
  required Field field,
  required FocusNode focusNode,
});

typedef PointOnMap = void Function({
  required double lat,
  required double lng,
});

class EditSightState extends ChangeNotifier {
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode detailsFocusNode = FocusNode();
  final FocusNode latFocusNode = FocusNode();
  final FocusNode longFocusNode = FocusNode();

  FocusNode? currentFocusNode;

  EditablePlace model;

  EditSightState(this.model);

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
    model = model.edit(command);

    notifyListeners();
  }

  void save() {
    if (!model.canSave) {
      return;
    }

    model = model.save();
    notifyListeners();
  }

  void onFocusChange({
    required EditablePlaceFieldKeys key,
    required Field field,
    required FocusNode focusNode,
  }) {
    if (!field.isDirty) {
      model = model.touchField(key);
    }

    currentFocusNode = !focusNode.hasFocus && currentFocusNode == focusNode ? null : focusNode;

    notifyListeners();
  }

  void nextField(FocusNode focusNode) {
    focusNode.unfocus();

    if (nameFocusNode == focusNode) {
      currentFocusNode = latFocusNode;
      FocusManager.instance.rootScope.requestFocus(latFocusNode);

      return;
    }

    if (latFocusNode == focusNode) {
      currentFocusNode = latFocusNode;
      FocusManager.instance.rootScope.requestFocus(longFocusNode);

      return;
    }

    if (longFocusNode == focusNode) {
      currentFocusNode = latFocusNode;
      FocusManager.instance.rootScope.requestFocus(detailsFocusNode);

      return;
    }

    if (detailsFocusNode == focusNode) {
      currentFocusNode = null;
      FocusManager.instance.primaryFocus?.unfocus();

      return;
    }

    throw UnimplementedError('Unknown FocusNode');
  }
}
