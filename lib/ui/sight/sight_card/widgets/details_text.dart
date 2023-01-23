import 'package:flutter/material.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/sight/sight.dart';

class SightDetailsText extends StatelessWidget {
  final Sight sight;

  const SightDetailsText({required this.sight, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();

    return Text(
      sight.details,
      style: textTheme?.small,
      overflow: TextOverflow.ellipsis,
    );
  }
}
