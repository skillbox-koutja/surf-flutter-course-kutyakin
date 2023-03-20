import 'package:flutter/material.dart';
import 'package:places/assets/theme/form_field_decorations.dart';
import 'package:places/domain/places/place/use_case/edit/model.dart';
import 'package:places/ui/components/field_icons/clear_icon.dart';
import 'package:places/ui/components/touch_detector.dart';
import 'package:places/ui/sight/edit_sight/edit_place_screen/wm.dart';
import 'package:provider/provider.dart';

class DetailsField extends StatelessWidget {
  const DetailsField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wm = context.read<IEditPlaceScreenWidgetModel>();
    final currentFocusNode = context.select<IEditPlaceScreenWidgetModel, FocusNode?>((wm) => wm.currentFocusNode.value);
    final detailsField =
        context.select<IEditPlaceScreenWidgetModel, EditablePlaceDetailsField>((wm) => wm.editablePlace.value.details);

    return TouchDetector(
      focusNode: wm.detailsFocusNode,
      onFocusChange: (focusNode) {
        wm.onFocusChange(
          key: EditablePlaceFieldKeys.details,
          field: detailsField,
          focusNode: focusNode,
        );
      },
      builder: ({
        required focusNode,
        required onFocusChange,
      }) {
        return TextFormField(
          controller: wm.detailsFieldController,
          focusNode: focusNode,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          minLines: 2,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: textFieldInputDecoration.copyWith(
            suffixIcon: currentFocusNode == focusNode && wm.detailsFieldController.text.isNotEmpty
                ? Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: FieldClearIcon(
                      controller: wm.detailsFieldController,
                    ),
                  )
                : null,
          ),
          onEditingComplete: () {
            wm.nextField(focusNode);
          },
          validator: (value) {
            if (detailsField.isDirty && !detailsField.isValid) {
              return '';
            }

            return null;
          },
        );
      },
    );
  }
}
