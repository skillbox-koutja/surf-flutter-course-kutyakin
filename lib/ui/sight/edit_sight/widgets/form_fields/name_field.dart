import 'package:flutter/material.dart';
import 'package:places/assets/theme/form_field_decorations.dart';
import 'package:places/domain/places/place/use_case/edit/model.dart';
import 'package:places/ui/components/field_icons/clear_icon.dart';
import 'package:places/ui/components/touch_detector.dart';
import 'package:places/ui/sight/edit_sight/edit_place_screen/wm.dart';
import 'package:provider/provider.dart';

class NameField extends StatelessWidget {
  const NameField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wm = context.read<IEditPlaceScreenWidgetModel>();
    final currentFocusNode = context.select<IEditPlaceScreenWidgetModel, FocusNode?>((wm) => wm.currentFocusNode.value);
    final nameField =
        context.select<IEditPlaceScreenWidgetModel, EditablePlaceNameField>((wm) => wm.editablePlace.value.name);

    return TouchDetector(
      focusNode: wm.nameFocusNode,
      onFocusChange: (focusNode) {
        wm.onFocusChange(
          key: EditablePlaceFieldKeys.name,
          field: nameField,
          focusNode: focusNode,
        );
      },
      builder: ({
        required focusNode,
        required onFocusChange,
      }) {
        return TextFormField(
          controller: wm.nameFieldController,
          focusNode: focusNode,
          decoration: textFieldInputDecoration.copyWith(
            suffixIcon: currentFocusNode == focusNode && wm.nameFieldController.text.isNotEmpty
                ? Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: FieldClearIcon(
                      controller: wm.nameFieldController,
                    ),
                  )
                : null,
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onEditingComplete: () {
            wm.nextField(focusNode);
          },
          validator: (value) {
            if (nameField.isDirty && !nameField.isValid) {
              return '';
            }

            return null;
          },
        );
      },
    );
  }
}
