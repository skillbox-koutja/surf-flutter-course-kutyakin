import 'package:flutter/widgets.dart';
import 'package:places/domain/sight/sight_type.dart';
import 'package:places/domain/sight/use_case/edit_sight/event.dart';
import 'package:places/domain/sight/use_case/edit_sight/model.dart';

typedef NextFieldHandler = void Function(FocusNode currentFocusNode);

typedef FocusChangeHandler = void Function(FocusNode focusNode);

typedef TouchedFieldChecker = bool Function(FocusNode focusNode);

typedef TouchedFormChecker = bool Function();

typedef PointOnMap = void Function({
  required double lat,
  required double long,
});

class EditSightState extends ChangeNotifier {
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode detailsFocusNode = FocusNode();
  final FocusNode latFocusNode = FocusNode();
  final FocusNode longFocusNode = FocusNode();

  final Map<FocusNode, bool> touchedFields = {};
  FocusNode? currentFocusNode;

  SightModel model;

  bool get isTouchedForm => touchedFields.isNotEmpty;

  EditSightState(this.model);

  @override
  void dispose() {
    touchedFields.clear();

    super.dispose();
  }

  void rename(String value) => dispatch(EditSightModelEvent.setName(value));

  void editDetails(String value) => dispatch(EditSightModelEvent.setDetails(value));

  void switchType(SightType value) => dispatch(EditSightModelEvent.setType(value));

  void editLat(double? value) => dispatch(EditSightModelEvent.setLat(value));

  void editLong(double? value) => dispatch(EditSightModelEvent.setLong(value));

  void pointOnMap({
    required double lat,
    required double long,
  }) =>
      dispatch(EditSightModelEvent.pointOnMap(
        lat: lat,
        long: long,
      ));

  void dispatch(EditSightModelEvent event) {
    final newModal = event.when(
      setName: (value) => model.copyWith(name: value),
      setDetails: (value) => model.copyWith(details: value),
      setType: (value) => model.copyWith(type: value),
      setLat: (value) => model.copyWith(lat: value),
      setLong: (value) => model.copyWith(long: value),
      pointOnMap: (lat, long) => model.copyWith(
        lat: lat,
        long: long,
      ),
    );

    model = newModal.validate();

    notifyListeners();
  }

  void onFocusChange(FocusNode focusNode) {
    touchedFields[focusNode] = focusNode.hasFocus;
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

  bool isTouchedField(FocusNode focusNode) {
    final result = focusNode.hasFocus || touchedFields.containsKey(focusNode);

    return result;
  }
}
