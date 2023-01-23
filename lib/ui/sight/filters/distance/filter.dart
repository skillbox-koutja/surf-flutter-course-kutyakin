import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/assets/theme/typography.dart';

class DistanceFilter extends StatefulWidget {
  const DistanceFilter({Key? key}) : super(key: key);

  @override
  State<DistanceFilter> createState() => _DistanceFilterState();
}

class _DistanceFilterState extends State<DistanceFilter> {
  double _startValue = 100.0;
  double _endValue = 10000.0;

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
                start: _startValue,
                end: _endValue,
              ),
              style: textTheme?.textSecondary,
            ),
          ],
        ),
        const SizedBox(height: 24),
        RangeSlider(
          min: 100.0,
          max: 10000.0,
          values: RangeValues(_startValue, _endValue),
          onChanged: (values) {
            setState(() {
              _startValue = values.start;
              _endValue = values.end;
            });
          },
        ),
      ],
    );
  }
}
