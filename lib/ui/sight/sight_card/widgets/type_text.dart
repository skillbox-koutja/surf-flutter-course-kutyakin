import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/places/place/model.dart';

class SightTypeText extends StatelessWidget {
  final Place place;

  const SightTypeText({required this.place, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();

    return Text(
      place.type.title,
      style: textTheme?.smallBold?.copyWith(
        color: AppColors.white,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
