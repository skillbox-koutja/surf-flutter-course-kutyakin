import 'package:flutter/material.dart';
import 'package:places/ui/sight/edit_sight/edit_sight_state.dart';
import 'package:provider/provider.dart';

class EditPlaceSubmitButton extends StatelessWidget {
  final String label;
  final VoidCallback onSubmit;

  const EditPlaceSubmitButton({
    required this.label,
    required this.onSubmit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isValid = context.select<EditSightState, bool>((s) => s.model.isValid);

    return ElevatedButton(
      onPressed: isValid ? onSubmit : null,
      child: Text(
        label,
      ),
    );
  }
}