import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/sight/editable_sight.dart';
import 'package:places/domain/sight/sight.dart';
import 'package:places/ui/sight/editing_sight/widgets/add_sight_form.dart';

class AddSightScreen extends StatefulWidget {
  final void Function() onClose;
  final void Function(Sight sight) onSave;

  const AddSightScreen({
    required this.onClose,
    required this.onSave,
    Key? key,
  }) : super(key: key);

  @override
  State<AddSightScreen> createState() => _AddSightScreenState();
}

class _AddSightScreenState extends State<AddSightScreen> {
  EditableSight sight = EditableSight();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 56 + MediaQuery.of(context).padding.top),
                      _Header(
                        onClose: widget.onClose,
                      ),
                      const SizedBox(height: 24),
                      AddSightForm(
                        sight: sight,
                        onChanged: onSightChanged,
                      ),
                      const Spacer(),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: (isValidForm()) ? createSight : null,
                          child: Text(
                            AppMessages.editingSight.createButtonLabel,
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).padding.bottom),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void onSightChanged(EditableSight value) {
    setState(() {
      sight = value;
    });
  }

  void createSight() {
    print(AppMessages.editingSight.createButtonLabel); // ignore: avoid_print

    if (sight.isValid) {
      widget.onSave(Sight.create(sight));
    }
  }

  bool isValidForm() {
    // final state = _formKey.currentState;
    // final isValid = state != null && state.validate();
    // print('form.isValid ? ${isValid ? 'true' : 'false'}'); // ignore: avoid_print
    // print('_sight.isValid ? ${_sight.isValid ? 'true' : 'false'}'); // ignore: avoid_print

    print(sight.toString()); // ignore: avoid_print

    return sight.isValid;
  }
}

class _Header extends StatelessWidget {
  final void Function() onClose;

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
