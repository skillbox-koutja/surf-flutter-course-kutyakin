import 'package:flutter/widgets.dart';
import 'package:places/domain/sight/sight_type.dart';
import 'package:places/domain/sight/use_case/edit_sight/error.dart';
import 'package:places/domain/sight/use_case/edit_sight/event.dart';
import 'package:places/domain/sight/use_case/edit_sight/model.dart';
import 'package:places/domain/sight/use_case/edit_sight/validator.dart';
import 'package:verify/verify.dart';

typedef NextFieldHandler = void Function(FocusNode currentFocusNode);

typedef FocusChangeHandler = void Function(FocusNode focusNode);

typedef TouchedChecker = bool Function(FocusNode focusNode);

typedef PointOnMap = void Function({
  required double lat,
  required double long,
});

class EditSightState extends ChangeNotifier {
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode detailsFocusNode = FocusNode();
  final FocusNode latFocusNode = FocusNode();
  final FocusNode longFocusNode = FocusNode();

  final Set<FocusNode> touchedFields = {};

  SightModel model;

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
    print('EditSightModelChangeNotifier.dispatch'); // ignore: avoid_print
    print(event.toString()); // ignore: avoid_print
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

    final errors = sightModelValidator.verify<EditSightModelError>(newModal).errorsGroupedBy((error) => error.field);

    model = newModal.copyWith(errors: errors);

    notifyListeners();
  }

  void onFocusChange(FocusNode focusNode) {
    touchedFields.add(focusNode);
  }

  void nextField(FocusNode currentFocusNode) {
    print('model.nextField'); // ignore: avoid_print
    if (nameFocusNode == currentFocusNode) {
      FocusManager.instance.rootScope.requestFocus(latFocusNode);

      return;
    }

    if (latFocusNode == currentFocusNode) {
      FocusManager.instance.rootScope.requestFocus(longFocusNode);

      return;
    }

    if (longFocusNode == currentFocusNode) {
      FocusManager.instance.rootScope.requestFocus(detailsFocusNode);

      return;
    }

    if (detailsFocusNode == currentFocusNode) {
      FocusManager.instance.primaryFocus?.unfocus();

      return;
    }

    print('model.nextField else??'); // ignore: avoid_print
  }

  bool isTouched(FocusNode focusNode) {
    final result = focusNode.hasFocus || touchedFields.contains(focusNode);

    return result;
  }
}
