import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/sight/sight.dart';
import 'package:places/domain/sight/use_case/edit_sight/model.dart';
import 'package:places/ui/sight/edit_sight/edit_sight_state.dart';
import 'package:places/ui/sight/edit_sight/widgets/add_sight_form.dart';
import 'package:provider/provider.dart';

class AddSightScreen extends StatefulWidget {
  final VoidCallback onClose;
  final ValueSetter<Sight> onSave;

  const AddSightScreen({
    required this.onClose,
    required this.onSave,
    Key? key,
  }) : super(key: key);

  @override
  State<AddSightScreen> createState() => _AddSightScreenState();
}

class _AddSightScreenState extends State<AddSightScreen> {
  late EditSightState sightModelNotifier;

  @override
  void initState() {
    super.initState();

    sightModelNotifier = EditSightState(SightModel.initial());
  }

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
                  SizedBox(height: 56 + MediaQuery.of(context).padding.top),
                  _Header(
                    onClose: widget.onClose,
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            AddSightForm(
              onSave: widget.onSave,
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 16.0).copyWith(bottom: 8 + MediaQuery.of(context).padding.bottom),
          child: SizedBox(
            width: double.infinity,
            child: _SubmitButton(
              onSubmit: onSubmit,
            ),
          ),
        ),
      ),
    );
  }

  void onSubmit() {
    final sightModel = sightModelNotifier.model;
    if (sightModel.isValid) {
      final sight = sightModelNotifier.model.toSight();
      widget.onSave(sight);
    }
  }
}

class _Header extends StatelessWidget {
  final VoidCallback onClose;

  const _Header({
    required this.onClose,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: onClose,
                child: Text(
                  AppMessages.editingSight.cancelTitle,
                  style: textTheme?.textSecondary,
                ),
              ),
            ],
          ),
          Center(
            child: Text(
              AppMessages.editingSight.newScreenTitle,
              style: textTheme?.subtitle,
            ),
          ),
        ],
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  final VoidCallback onSubmit;
  const _SubmitButton({
    required this.onSubmit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isValid = context.select<EditSightState, bool>((s) => s.model.isValid);

    return ElevatedButton(
      onPressed: isValid ? onSubmit : null,
      child: Text(
        AppMessages.editingSight.createButtonLabel,
      ),
    );
  }
}
