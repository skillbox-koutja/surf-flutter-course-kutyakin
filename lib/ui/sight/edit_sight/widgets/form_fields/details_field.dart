import 'package:flutter/material.dart';
import 'package:places/assets/theme/form_field_decorations.dart';
import 'package:places/domain/sight/use_case/edit_sight/error.dart';
import 'package:places/ui/components/field_icons/clear_icon.dart';
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
    final onChanged = context.select<EditSightState, ValueChanged<String>>((s) => s.editDetails);

    return _Input(
      value: initialValue,
      onChanged: onChanged,
    );
  }
}

class _Input extends StatefulWidget {
  final String? value;
  final ValueChanged<String> onChanged;

  const _Input({
    required this.value,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<_Input> createState() => _InputState();
}

class _InputState extends State<_Input> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.value);

    controller.addListener(onChanged);
  }

  @override
  void dispose() {
    controller
      ..removeListener(onChanged)
      ..dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final error = context.select<EditSightState, EditSightModelError?>((s) => s.model.detailsError);
    final focusNode = context.select<EditSightState, FocusNode>((s) => s.detailsFocusNode);
    final onFocusChange = context.select<EditSightState, FocusChangeHandler>((s) => s.onFocusChange);
    final isTouched = context.select<EditSightState, TouchedFieldChecker>((s) => s.isTouchedField);
    final nextField = context.select<EditSightState, NextFieldHandler>((s) => s.nextField);
    final currentFocusNode = context.select<EditSightState, FocusNode?>((s) => s.currentFocusNode);

    return TouchDetector(
      focusNode: focusNode,
      onFocusChange: onFocusChange,
      builder: ({
        required focusNode,
        required onFocusChange,
      }) {
        return TextFormField(
          controller: controller,
          focusNode: focusNode,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          minLines: 2,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: textFieldInputDecoration.copyWith(
            suffixIcon: currentFocusNode == focusNode && controller.text.isNotEmpty ? Align(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: FieldClearIcon(
                controller: controller,
              ),
            ) : null,
          ),
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

  void onChanged() {
    final value = controller.text;
    widget.onChanged(value);
  }
}
