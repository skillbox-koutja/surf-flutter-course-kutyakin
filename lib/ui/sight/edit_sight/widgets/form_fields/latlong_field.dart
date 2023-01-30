import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/assets/theme/form_field_decorations.dart';
import 'package:places/domain/sight/use_case/edit_sight/error.dart';
import 'package:places/ui/components/touch_detector.dart';
import 'package:places/ui/sight/edit_sight/edit_sight_state.dart';
import 'package:places/ui/sight/edit_sight/widgets/field_label.dart';
import 'package:provider/provider.dart';

class LatLongField extends StatelessWidget {
  final FocusNode focusNode;
  final String label;
  final EditSightModelError? error;
  final ValueChanged<double?> onChanged;
  final TextEditingController controller;

  const LatLongField({
    required this.focusNode,
    required this.controller,
    required this.label,
    required this.error,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final onFocusChange = context.select<EditSightState, FocusChangeHandler>((s) => s.onFocusChange);
    final isTouched = context.select<EditSightState, TouchedChecker>((s) => s.isTouched);
    final nextField = context.select<EditSightState, NextFieldHandler>((s) => s.nextField);

    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FieldLabel(
            label: label,
          ),
          TouchDetector(
            focusNode: focusNode,
            onFocusChange: onFocusChange,
            builder: ({
              required focusNode,
              required void Function() onFocusChange,
            }) {
              return TextFormField(
                controller: controller,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                focusNode: focusNode,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('^[0-9]+.?[0-9]*')),
                ],
                decoration: doubleFieldInputDecoration,
                onEditingComplete: () {
                  nextField(focusNode);
                },
                onChanged: (value) {
                  onChanged(double.tryParse(value));
                },
                validator: (value) {
                  if (isTouched(focusNode) && error != null) {
                    return '';
                  }

                  return null;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
