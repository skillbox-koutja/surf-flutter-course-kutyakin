import 'package:flutter/material.dart';
import 'package:places/assets/theme/form_field_decorations.dart';
import 'package:places/domain/sight/use_case/edit_sight/error.dart';
import 'package:places/ui/components/touch_detector.dart';
import 'package:places/ui/sight/edit_sight/edit_sight_state.dart';
import 'package:provider/provider.dart';

class DetailsField extends StatelessWidget {
  const DetailsField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final initialValue = context.select<EditSightState, String?>((s) => s.model.details);
    final error = context.select<EditSightState, EditSightModelError?>((s) => s.model.detailsError);
    final focusNode = context.select<EditSightState, FocusNode>((s) => s.detailsFocusNode);
    final onChanged = context.select<EditSightState, ValueChanged<String>>((s) => s.editDetails);
    final onFocusChange = context.select<EditSightState, FocusChangeHandler>((s) => s.onFocusChange);
    final isTouched = context.select<EditSightState, TouchedFieldChecker>((s) => s.isTouchedField);
    final nextField = context.select<EditSightState, NextFieldHandler>((s) => s.nextField);

    return TouchDetector(
      focusNode: focusNode,
      onFocusChange: onFocusChange,
      builder: ({
        required focusNode,
        required onFocusChange,
      }) {
        return TextFormField(
          initialValue: initialValue,
          focusNode: focusNode,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          minLines: 2,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: textFieldInputDecoration,
          onChanged: onChanged,
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
