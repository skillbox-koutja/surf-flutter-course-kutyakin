import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/core/field/field.dart';
import 'package:places/domain/places/place/entity.dart';
import 'package:places/domain/places/place/model.dart';
import 'package:places/domain/places/place/photo.dart';
import 'package:places/domain/places/place/type.dart';
import 'package:places/domain/places/place/use_case/edit/model.dart';
import 'package:places/ui/sight/edit_sight/edit_place_screen/m.dart';
import 'package:places/ui/sight/edit_sight/edit_place_screen/w.dart';

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

WidgetModelFactory createEditPlaceScreenWidgetModelFactory(
  PlaceEntity placeEntity,
) {
  final model = EditPlaceScreenModel(
    editablePlace: EditablePlace.editPlace(placeEntity.place),
  );

  return (_) => EditPlaceScreenWidgetModel(model);
}

WidgetModelFactory createAddPlaceScreenWidgetModelFactory() {
  final model = EditPlaceScreenModel(
    editablePlace: EditablePlace.newPlace(),
  );

  return (_) => EditPlaceScreenWidgetModel(model);
}

class EditPlaceScreenWidgetModel extends WidgetModel<EditPlaceScreen, EditPlaceScreenModel>
    implements IEditPlaceScreenWidgetModel {
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _detailsFocusNode = FocusNode();
  final FocusNode _latFocusNode = FocusNode();
  final FocusNode _lngFocusNode = FocusNode();

  late final TextEditingController _nameFieldController;
  late final TextEditingController _detailsFieldController;
  late final TextEditingController _latFieldController;
  late final TextEditingController _lngFieldController;

  @override
  FocusNode get nameFocusNode => _nameFocusNode;

  @override
  FocusNode get detailsFocusNode => _detailsFocusNode;

  @override
  FocusNode get latFocusNode => _latFocusNode;

  @override
  FocusNode get lngFocusNode => _lngFocusNode;

  @override
  TextEditingController get nameFieldController => _nameFieldController;

  @override
  TextEditingController get detailsFieldController => _detailsFieldController;

  @override
  TextEditingController get latFieldController => _latFieldController;

  @override
  TextEditingController get lngFieldController => _lngFieldController;

  @override
  ValueListenable<EditablePlace> get editablePlace => model.editablePlaceNotifier;

  @override
  ValueListenable<FocusNode?> get currentFocusNode => model.currentFocusNodeNotifier;

  EditPlaceScreenWidgetModel(
    EditPlaceScreenModel model,
  ) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _nameFieldController = TextEditingController(text: editablePlace.value.name.value);
    _detailsFieldController = TextEditingController(text: editablePlace.value.details.value);
    _latFieldController = TextEditingController(text: editablePlace.value.lat.value?.toString());
    _lngFieldController = TextEditingController(text: editablePlace.value.lng.value?.toString());

    _nameFieldController.addListener(_onNameChanged);
    _detailsFieldController.addListener(_onDetailsChanged);
    _latFieldController.addListener(_onLatChanged);
    _lngFieldController.addListener(_onLngChanged);
  }

  @override
  void dispose() {
    _nameFieldController
      ..removeListener(_onNameChanged)
      ..dispose();
    _detailsFieldController
      ..removeListener(_onDetailsChanged)
      ..dispose();
    _latFieldController
      ..removeListener(_onLatChanged)
      ..dispose();
    _lngFieldController
      ..removeListener(_onLngChanged)
      ..dispose();

    super.dispose();
  }

  @override
  void onSwitchType(PlaceType type) {
    model.switchType(type);
  }

  @override
  void onAddPhoto(PlacePhoto photo) {
    model.addPhoto(photo);
  }

  @override
  void onRemovePhoto(PlacePhoto photo) {
    model.removePhoto(photo);
  }

  @override
  void onPointOnMap({
    required double lat,
    required double lng,
  }) {
    model.pointOnMap(
      lat: lat,
      lng: lng,
    );
  }

  @override
  void onFocusChange({
    required EditablePlaceFieldKeys key,
    required Field field,
    required FocusNode focusNode,
  }) {
    model.changeFieldFocus(
      key: key,
      field: field,
      focusNode: focusNode,
    );
  }

  @override
  void nextField(FocusNode focusNode) {
    focusNode.unfocus();

    if (nameFocusNode == focusNode) {
      model.currentFocusNode = latFocusNode;
      FocusManager.instance.rootScope.requestFocus(latFocusNode);

      return;
    }

    if (latFocusNode == focusNode) {
      model.currentFocusNode = latFocusNode;
      FocusManager.instance.rootScope.requestFocus(lngFocusNode);

      return;
    }

    if (lngFocusNode == focusNode) {
      model.currentFocusNode = latFocusNode;
      FocusManager.instance.rootScope.requestFocus(detailsFocusNode);

      return;
    }

    if (detailsFocusNode == focusNode) {
      model.clearFocus();
      FocusManager.instance.primaryFocus?.unfocus();

      return;
    }

    throw UnimplementedError('Unknown FocusNode');
  }

  @override
  void save() {
    model.save();
  }

  void _onNameChanged() {
    final value = _nameFieldController.text;

    if (value == editablePlace.value.name.value) {
      return;
    }

    model.rename(value);
  }

  void _onDetailsChanged() {
    final value = _detailsFieldController.text;

    if (value == editablePlace.value.details.value) {
      return;
    }

    model.editDetails(value);
  }

  void _onLatChanged() {
    _onLatLngChanged(
      controller: _latFieldController,
      field: model.editablePlace.lat,
      onChanged: model.editLat,
    );
  }

  void _onLngChanged() {
    _onLatLngChanged(
      controller: _lngFieldController,
      field: model.editablePlace.lng,
      onChanged: model.editLng,
    );
  }

  void _onLatLngChanged({
    required TextEditingController controller,
    required EditablePlaceGeoField field,
    required ValueChanged<double?> onChanged,
  }) {
    final text = controller.text;
    final value = double.tryParse(text);

    if (!field.isDirty) {
      return;
    }
    if (value == field.value && field.errors.isEmpty) {
      return;
    }

    onChanged(value);
  }
}

abstract class IEditPlaceScreenWidgetModel extends IWidgetModel {
  FocusNode get nameFocusNode;

  FocusNode get detailsFocusNode;

  FocusNode get latFocusNode;

  FocusNode get lngFocusNode;

  TextEditingController get nameFieldController;

  TextEditingController get detailsFieldController;

  TextEditingController get latFieldController;

  TextEditingController get lngFieldController;

  ValueListenable<EditablePlace> get editablePlace;

  ValueListenable<FocusNode?> get currentFocusNode;

  void onSwitchType(PlaceType type);

  void onAddPhoto(PlacePhoto photo);

  void onRemovePhoto(PlacePhoto photo);

  void onPointOnMap({
    required double lat,
    required double lng,
  });

  void onFocusChange({
    required EditablePlaceFieldKeys key,
    required Field field,
    required FocusNode focusNode,
  });

  void nextField(FocusNode focusNode);

  void save();
}
