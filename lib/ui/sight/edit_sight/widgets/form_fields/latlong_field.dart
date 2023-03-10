import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/assets/theme/form_field_decorations.dart';
import 'package:places/domain/places/place/use_case/edit/model.dart';
import 'package:places/ui/components/field_icons/clear_icon.dart';
import 'package:places/ui/components/touch_detector.dart';
import 'package:places/ui/sight/edit_sight/edit_sight_state.dart';
import 'package:places/ui/sight/edit_sight/widgets/field_label.dart';
import 'package:provider/provider.dart';

class LatLongField extends StatefulWidget {
  final EditablePlaceFieldKeys fieldKey;
  final EditablePlaceGeoField field;
  final FocusNode focusNode;
  final String label;
  final ValueChanged<double?> onChanged;
  final TextEditingController controller;

  const LatLongField({
    required this.fieldKey,
    required this.field,
    required this.focusNode,
    required this.controller,
    required this.label,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<LatLongField> createState() => _LatLongFieldState();
}

class _LatLongFieldState extends State<LatLongField> {
  @override
  void initState() {
    super.initState();

    widget.controller.addListener(onChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(onChanged);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final onFocusChange = context.select<EditSightState, FocusChangeHandler>((s) => s.onFocusChange);
    final nextField = context.select<EditSightState, NextFieldHandler>((s) => s.nextField);
    final currentFocusNode = context.select<EditSightState, FocusNode?>((s) => s.currentFocusNode);

    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FieldLabel(
            label: widget.label,
          ),
          TouchDetector(
            focusNode: widget.focusNode,
            onFocusChange: (focusNode) {
              onFocusChange(
                key: widget.fieldKey,
                field: widget.field,
                focusNode: focusNode,
              );
            },
            builder: ({
              required focusNode,
              required onFocusChange,
            }) {
              return TextFormField(
                controller: widget.controller,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                focusNode: focusNode,
                keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[\d+\-\.]')),
                ],
                decoration: doubleFieldInputDecoration.copyWith(
                  suffixIcon: currentFocusNode == focusNode && widget.controller.text.isNotEmpty
                      ? Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: FieldClearIcon(
                            controller: widget.controller,
                          ),
                        )
                      : null,
                ),
                onEditingComplete: () {
                  nextField(focusNode);
                },
                validator: (value) {
                  if (widget.field.isDirty && !widget.field.isValid) {
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

  void onChanged() {
    final text = widget.controller.text;
    final value = double.tryParse(text);

    debugPrint('$text => $value == ${widget.field.value}');
    debugPrint(widget.field.errors.isEmpty ? 'nice': widget.field.errors.first.errorDescription);
    debugPrint(widget.field.isDirty ? 'dirty': 'clean');
    if (!widget.field.isDirty) {
      return;
    }
    if (value == widget.field.value && widget.field.errors.isEmpty) {
      return;
    }

    widget.onChanged(value);
  }
}
