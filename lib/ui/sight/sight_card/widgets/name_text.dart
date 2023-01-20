import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/sight/sight.dart';

class SightNameText extends StatelessWidget {
  final Sight sight;

  const SightNameText({required this.sight, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();

    return Text(
      sight.name,
      style: textTheme?.text,
      overflow: TextOverflow.ellipsis,
    );
  }
}
