import 'package:flutter/material.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/places/place/model.dart';

class SightNameText extends StatelessWidget {
  final Place place;

  const SightNameText({required this.place, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();

    return Text(
      place.name,
      style: textTheme?.text,
      overflow: TextOverflow.ellipsis,
    );
  }
}
