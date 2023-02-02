import 'package:flutter/material.dart';
import 'package:places/assets/theme/typography.dart';

class EmptyState extends StatelessWidget {
  final Widget icon;
  final String title;
  final String description;

  const EmptyState({
    required this.icon,
    required this.title,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        const SizedBox(height: 24),
        Text(
          title,
          style: textTheme?.subtitle?.copyWith(
            color: theme.disabledColor,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: textTheme?.small?.copyWith(
            color: theme.disabledColor,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
