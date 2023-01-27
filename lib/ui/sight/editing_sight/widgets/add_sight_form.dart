import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/domain/sight/editable_sight.dart';
import 'package:places/ui/sight/editing_sight/widgets/field_label.dart';
import 'package:places/ui/sight/editing_sight/widgets/form_fields/category_select_field.dart';
import 'package:places/ui/sight/editing_sight/widgets/form_fields/details_field.dart';
import 'package:places/ui/sight/editing_sight/widgets/form_fields/latlong_field.dart';
import 'package:places/ui/sight/editing_sight/widgets/form_fields/name_field.dart';

class AddSightForm extends StatefulWidget {
  final EditableSight sight;
  final ValueChanged<EditableSight> onChanged;

  const AddSightForm({
    required this.sight,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<AddSightForm> createState() => _AddSightFormState();
}

class _AddSightFormState extends State<AddSightForm> {
  final Set<FocusNode> touchedFields = {};

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FieldLabel(
            label: AppMessages.editingSight.selectCategoryFieldLabel,
          ),
          CategorySelectField(
            sight: widget.sight,
            onChanged: widget.onChanged,
          ),
          const SizedBox(height: 24),
          FieldLabel(
            label: AppMessages.editingSight.nameFieldLabel,
          ),
          NameField(
            sight: widget.sight,
            onChanged: widget.onChanged,
            onFocusChange: onFocusChange,
            isTouched: isTouched,
          ),
          const SizedBox(height: 24),
          LatLongField(
            sight: widget.sight,
            onChanged: widget.onChanged,
            onFocusChange: onFocusChange,
            isTouched: isTouched,
          ),
          const SizedBox(height: 37),
          FieldLabel(
            label: AppMessages.editingSight.detailsFieldLabel,
          ),
          DetailsField(
            sight: widget.sight,
            onChanged: widget.onChanged,
            onFocusChange: onFocusChange,
            isTouched: isTouched,
          ),
        ],
      ),
    );
  }

  void onFocusChange(FocusNode focusNode) {
    touchedFields.add(focusNode);
  }

  bool isTouched(FocusNode focusNode) {
    final result = focusNode.hasFocus || touchedFields.contains(focusNode);

    return result;
  }
}
