import 'package:flutter/material.dart';
import 'package:places/domain/places/place/use_case/edit/model.dart';
import 'package:places/ui/sight/edit_sight/edit_sight_state.dart';
import 'package:places/ui/sight/edit_sight/widgets/edit_form.dart';
import 'package:places/ui/sight/edit_sight/widgets/header.dart';
import 'package:places/ui/sight/edit_sight/widgets/submit_button.dart';
import 'package:provider/provider.dart';

class EditPlaceBody extends StatelessWidget {
  final EditSightState sightModelNotifier;
  final String submitButtonLabel;
  final VoidCallback onClose;
  final VoidCallback onSubmit;
  final EditablePlace? model;

  const EditPlaceBody({
    required this.sightModelNotifier,
    required this.submitButtonLabel,
    required this.onClose,
    required this.onSubmit,
    this.model,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => sightModelNotifier,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).padding.top),
                  EditPlaceHeader(
                    onClose: onClose,
                  ),
                ],
              ),
            ),
            const EditPlaceForm(),
          ],
        ),
        bottomNavigationBar: Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 16.0).copyWith(bottom: 8 + MediaQuery.of(context).padding.bottom),
          child: SizedBox(
            width: double.infinity,
            child: EditPlaceSubmitButton(
              label: submitButtonLabel,
              onSubmit: onSubmit,
            ),
          ),
        ),
      ),
    );
  }
}
