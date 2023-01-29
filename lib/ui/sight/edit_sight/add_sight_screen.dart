import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/sight/sight.dart';
import 'package:places/ui/sight/edit_sight/widgets/add_sight_form.dart';

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
                        onSave: widget.onSave,
                      ),
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
