import 'package:flutter/material.dart';
import 'package:places/assets/theme/typography.dart';

class FieldLabel extends StatelessWidget {
  final String label;

  const FieldLabel({
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        label,
        style: textTheme?.superSmall?.copyWith(
          color: theme.disabledColor,
        ),
      ),
    );
  }
}
