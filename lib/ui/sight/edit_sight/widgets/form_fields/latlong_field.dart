import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/assets/theme/form_field_decorations.dart';
import 'package:places/domain/places/place/use_case/edit/model.dart';
import 'package:places/ui/components/field_icons/clear_icon.dart';
import 'package:places/ui/components/touch_detector.dart';
import 'package:places/ui/sight/edit_sight/edit_place_screen/wm.dart';
import 'package:places/ui/sight/edit_sight/widgets/field_label.dart';
import 'package:provider/provider.dart';

class LatLongField extends StatelessWidget {
  final EditablePlaceFieldKeys fieldKey;
  final EditablePlaceGeoField field;
  final FocusNode focusNode;
  final String label;
  final TextEditingController controller;

  const LatLongField({
    required this.fieldKey,
    required this.field,
    required this.focusNode,
    required this.controller,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wm = context.read<IEditPlaceScreenWidgetModel>();
    final currentFocusNode = context.select<IEditPlaceScreenWidgetModel, FocusNode?>((wm) => wm.currentFocusNode.value);

    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FieldLabel(
            label: label,
          ),
          TouchDetector(
            focusNode: focusNode,
            onFocusChange: (focusNode) {
              wm.onFocusChange(
                key: fieldKey,
                field: field,
                focusNode: focusNode,
              );
            },
            builder: ({
              required focusNode,
              required onFocusChange,
            }) {
              return TextFormField(
                controller: controller,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                focusNode: focusNode,
                keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[\d+\-\.]')),
                ],
                decoration: doubleFieldInputDecoration.copyWith(
                  suffixIcon: currentFocusNode == focusNode && controller.text.isNotEmpty
                      ? Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: FieldClearIcon(
                            controller: controller,
                          ),
                        )
                      : null,
                ),
                onEditingComplete: () {
                  wm.nextField(focusNode);
                },
                validator: (value) {
                  if (field.isDirty && !field.isValid) {
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
