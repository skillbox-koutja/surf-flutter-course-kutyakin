import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/domain/places/place/use_case/edit/model.dart';
import 'package:places/ui/sight/edit_sight/edit_place_screen/wm.dart';
import 'package:places/ui/sight/edit_sight/widgets/body.dart';

class AddPlaceScreen extends ElementaryWidget<IEditPlaceScreenWidgetModel> {
  final VoidCallback onClose;
  final ValueSetter<EditablePlace> onSave;
  final EditablePlace? model;

  const AddPlaceScreen({
    required this.onClose,
    required this.onSave,
    required WidgetModelFactory wmFactory,
    this.model,
    Key? key,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IEditPlaceScreenWidgetModel wm) {
    return EditPlaceBody(
      wm: wm,
      onClose: onClose,
      onSubmit: () {
        onSave(wm.editablePlace.value);
        wm.save();
      },
      submitButtonLabel: AppMessages.editingSight.createButtonLabel,
    );
  }
}
