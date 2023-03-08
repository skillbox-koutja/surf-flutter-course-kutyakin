import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/domain/places/place/entity.dart';
import 'package:places/domain/places/place/use_case/edit/model.dart';
import 'package:places/ui/sight/edit_sight/edit_sight_state.dart';
import 'package:places/ui/sight/edit_sight/widgets/body.dart';

class EditPlaceScreen extends StatefulWidget {
  final PlaceEntity placeEntity;
  final VoidCallback onClose;
  final ValueSetter<EditablePlace> onSave;
  final EditablePlace? model;

  const EditPlaceScreen({
    required this.placeEntity,
    required this.onClose,
    required this.onSave,
    this.model,
    Key? key,
  }) : super(key: key);

  @override
  State<EditPlaceScreen> createState() => _EditPlaceScreenState();
}

class _EditPlaceScreenState extends State<EditPlaceScreen> {
  late EditSightState sightModelNotifier;

  @override
  void initState() {
    super.initState();

    sightModelNotifier = EditSightState(EditablePlace.editPlace(widget.placeEntity.place));
  }

  @override
  Widget build(BuildContext context) {
    return EditPlaceBody(
      sightModelNotifier: sightModelNotifier,
      onClose: widget.onClose,
      onSubmit: onSubmit,
      submitButtonLabel: AppMessages.editingSight.saveButtonLabel,
    );
  }

  Future<void> onSubmit() async {
    widget.onSave(sightModelNotifier.model);
    sightModelNotifier.save();
  }
}
