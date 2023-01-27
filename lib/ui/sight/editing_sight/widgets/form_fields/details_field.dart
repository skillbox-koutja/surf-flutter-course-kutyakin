import 'package:flutter/material.dart';
import 'package:places/assets/theme/form_field_decorations.dart';
import 'package:places/domain/sight/editable_sight.dart';
import 'package:places/ui/components/touch_detector.dart';

class DetailsField extends StatelessWidget {
  final EditableSight sight;
  final ValueChanged<EditableSight> onChanged;
  final void Function(FocusNode focusNode) onFocusChange;
  final bool Function(FocusNode focusNode) isTouched;

  const DetailsField({
    required this.sight,
    required this.onChanged,
    required this.onFocusChange,
    required this.isTouched,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchDetector(
      onFocusChange: onFocusChange,
      builder: ({
        required focusNode,
        required void Function() onFocusChange,
      }) {
        return TextFormField(
          focusNode: focusNode,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          minLines: 2,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: textFieldInputDecoration,
          onChanged: (value) {
            onChanged(sight.copyWith(details: value));
          },
          validator: (value) {
            if (isTouched(focusNode) && !sight.isValidDetails) {
              return '';
            }

            return null;
          },
        );
      },
    );
  }
}
