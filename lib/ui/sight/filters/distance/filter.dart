import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/typography.dart';

class DistanceFilter extends StatelessWidget {
  static const min = 100.0;
  static const max = 10000.0;
  final double distance;
  final ValueChanged<double>? onChanged;

  const DistanceFilter({
    required this.distance,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppMessages.sightFilters.distanceTitle,
              style: textTheme?.text,
            ),
            Text(
              AppMessages.sightFilters.distanceRangeSliderTitle(
                start: min,
                end: max,
              ),
              style: textTheme?.textSecondary,
            ),
          ],
        ),
        const SizedBox(height: 24),
        Slider(
          min: 100.0,
          max: 10000.0,
          value: distance,
          onChanged: onChanged,
        ),
        const SizedBox(height: 24),
        Text(
          AppMessages.sightFilters.distanceSliderTitle(distance),
          style: textTheme?.text,
        ),
      ],
    );
  }
}
