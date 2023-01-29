import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/domain/sight/sight.dart';
import 'package:places/domain/sight/use_case/edit_sight/model.dart';
import 'package:places/ui/sight/edit_sight/edit_sight_model.dart';
import 'package:places/ui/sight/edit_sight/widgets/field_label.dart';
import 'package:places/ui/sight/edit_sight/widgets/form_fields/category_select_field.dart';
import 'package:places/ui/sight/edit_sight/widgets/form_fields/details_field.dart';
import 'package:places/ui/sight/edit_sight/widgets/form_fields/latlong_field_group.dart';
import 'package:places/ui/sight/edit_sight/widgets/form_fields/name_field.dart';
import 'package:provider/provider.dart';

class AddSightForm extends StatefulWidget {
  final ValueChanged<Sight> onSave;

  const AddSightForm({
    required this.onSave,
    Key? key,
  }) : super(key: key);

  @override
  State<AddSightForm> createState() => _AddSightFormState();
}

class _AddSightFormState extends State<AddSightForm> {
  late EditSightModel sightModelNotifier;

  @override
  void initState() {
    super.initState();

    sightModelNotifier = EditSightModel(SightModel.initial());
    // sightModelNotifier = EditSightModel(SightModel.initialFilled());
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: EdgeInsets.only(bottom: 8 + MediaQuery.of(context).padding.bottom),
        child: ChangeNotifierProvider(
          create: (context) => sightModelNotifier,
          child: Form(
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
                LatLongFieldGroup(
                  lat: sightModelNotifier.model.lat,
                  long: sightModelNotifier.model.long,
                ),
                const SizedBox(height: 37),
                FieldLabel(
                  label: AppMessages.editingSight.detailsFieldLabel,
                ),
                const DetailsField(),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: _SubmitButton(
                    onSubmit: onSubmit,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onSubmit() {
    print(AppMessages.editingSight.createButtonLabel); // ignore: avoid_print

    final sightModel = sightModelNotifier.model;
    if (sightModel.isValid) {
      final sight = sightModelNotifier.model.toSight();
      widget.onSave(sight);
    }
  }
}

class _SubmitButton extends StatelessWidget {
  final void Function() onSubmit;
  const _SubmitButton({
    required this.onSubmit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isValid = context.select<EditSightModel, bool>((m) => m.model.isValid);

    return ElevatedButton(
      onPressed: isValid ? onSubmit : null,
      child: Text(
        AppMessages.editingSight.createButtonLabel,
      ),
    );
  }
}
