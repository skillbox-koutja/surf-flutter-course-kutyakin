import 'package:flutter/material.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/sight/sight_status.dart';

class SightStatusText extends StatelessWidget {
  final SightStatus status;
  final Color color;

  const SightStatusText({required this.status, required this.color, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();

    return Text(
      status.toString(),
      style: textTheme?.small?.copyWith(
        color: color,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
