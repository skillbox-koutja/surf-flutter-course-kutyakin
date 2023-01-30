import 'package:flutter/material.dart';
import 'package:places/assets/theme/form_field_decorations.dart';
import 'package:places/domain/sight/use_case/edit_sight/error.dart';
import 'package:places/ui/components/touch_detector.dart';
import 'package:places/ui/sight/edit_sight/edit_sight_state.dart';
import 'package:provider/provider.dart';

class NameField extends StatelessWidget {
  const NameField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('NameField.build'); // ignore: avoid_print
    final initialValue = context.select<EditSightState, String?>((s) => s.model.name);
    final error = context.select<EditSightState, EditSightModelError?>((s) => s.model.nameError);
    final focusNode = context.select<EditSightState, FocusNode>((s) => s.nameFocusNode);
    final onChanged = context.select<EditSightState, ValueChanged<String>>((s) => s.rename);
    final onFocusChange = context.select<EditSightState, FocusChangeHandler>((s) => s.onFocusChange);
    final isTouched = context.select<EditSightState, TouchedChecker>((s) => s.isTouched);
    final nextField = context.select<EditSightState, NextFieldHandler>((s) => s.nextField);

    return TouchDetector(
      focusNode: focusNode,
      onFocusChange: onFocusChange,
      builder: ({
        required focusNode,
        required void Function() onFocusChange,
      }) {
        return TextFormField(
          initialValue: initialValue,
          focusNode: focusNode,
          decoration: textFieldInputDecoration,
          onChanged: onChanged,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onEditingComplete: () {
            nextField(focusNode);
          },
          validator: (value) {
            if (isTouched(focusNode) && error != null) {
              return '';
            }

            return null;
          },
        );
      },
    );
  }
}
