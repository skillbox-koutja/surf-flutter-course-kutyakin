import 'package:flutter/material.dart';
import 'package:places/assets/theme/form_field_decorations.dart';
import 'package:places/domain/sight/use_case/edit_sight/error.dart';
import 'package:places/ui/components/touch_detector.dart';
import 'package:places/ui/sight/edit_sight/edit_sight_model.dart';
import 'package:provider/provider.dart';

class DetailsField extends StatelessWidget {
  const DetailsField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Details.build'); // ignore: avoid_print
    final initialValue = context.select<EditSightModel, String?>((m) => m.model.details);
    final error = context.select<EditSightModel, EditSightModelError?>((m) => m.model.detailsError);
    final focusNode = context.select<EditSightModel, FocusNode>((m) => m.detailsFocusNode);
    final onChanged = context.select<EditSightModel, ValueChanged<String>>((m) => m.editDetails);
    final onFocusChange = context.select<EditSightModel, FocusChangeHandler>((m) => m.onFocusChange);
    final isTouched = context.select<EditSightModel, TouchedChecker>((m) => m.isTouched);
    final nextField = context.select<EditSightModel, NextFieldHandler>((m) => m.nextField);

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
