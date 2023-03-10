import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/domain/places/place/use_case/edit/model.dart';
import 'package:places/ui/sight/edit_sight/edit_sight_state.dart';
import 'package:places/ui/sight/edit_sight/widgets/body.dart';

class AddPlaceScreen extends StatefulWidget {
  final VoidCallback onClose;
  final ValueSetter<EditablePlace> onSave;
  final EditablePlace? model;

  const AddPlaceScreen({
    required this.onClose,
    required this.onSave,
    this.model,
    Key? key,
  }) : super(key: key);

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  late EditSightState sightModelNotifier;

  @override
  void initState() {
    super.initState();

    sightModelNotifier = EditSightState(widget.model ?? EditablePlace.newPlace());
  }

  @override
  Widget build(BuildContext context) {
    return EditPlaceBody(
      sightModelNotifier: sightModelNotifier,
      onClose: widget.onClose,
      onSubmit: onSubmit,
      submitButtonLabel: AppMessages.editingSight.createButtonLabel,
    );
  }

  Future<void> onSubmit() async {
    sightModelNotifier.save();
    widget.onSave(sightModelNotifier.model);
  }
}
