import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/ui/sight/edit_sight/edit_place_screen/wm.dart';
import 'package:places/ui/sight/edit_sight/widgets/field_label.dart';
import 'package:places/ui/sight/edit_sight/widgets/form_fields/add_photo_field.dart';
import 'package:places/ui/sight/edit_sight/widgets/form_fields/category_select_field.dart';
import 'package:places/ui/sight/edit_sight/widgets/form_fields/details_field.dart';
import 'package:places/ui/sight/edit_sight/widgets/form_fields/latlong_field_group.dart';
import 'package:places/ui/sight/edit_sight/widgets/form_fields/name_field.dart';
import 'package:provider/provider.dart';

class EditPlaceForm extends StatelessWidget {
  const EditPlaceForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: EdgeInsets.only(bottom: 8 + MediaQuery.of(context).padding.bottom),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Form(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const AddPhotoField(),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FieldLabel(
                        label: AppMessages.editingSight.selectCategoryFieldLabel,
                      ),
                      const CategorySelectField(),
                      const SizedBox(height: 24),
                      FieldLabel(
                        label: AppMessages.editingSight.nameFieldLabel,
                      ),
                      const NameField(),
                      const SizedBox(height: 24),
                      const _LatLong(),
                      const SizedBox(height: 37),
                      FieldLabel(
                        label: AppMessages.editingSight.detailsFieldLabel,
                      ),
                      const DetailsField(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LatLong extends StatelessWidget {
  const _LatLong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lat = context.select<IEditPlaceScreenWidgetModel, double?>((s) => s.editablePlace.value.lat.value);
    final lng = context.select<IEditPlaceScreenWidgetModel, double?>((s) => s.editablePlace.value.lng.value);

    return LatLongFieldGroup(
      lat: lat,
      lng: lng,
    );
  }
}
