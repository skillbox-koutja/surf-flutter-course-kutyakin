import 'package:flutter/material.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/places/place/model.dart';

class SightDetailsText extends StatelessWidget {
  final Place place;

  const SightDetailsText({required this.place, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();

    return Text(
      place.details,
      style: textTheme?.small,
      overflow: TextOverflow.ellipsis,
    );
  }
}
