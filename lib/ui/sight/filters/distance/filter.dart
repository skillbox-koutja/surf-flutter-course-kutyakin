import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/ui/sight/filters/filters_state.dart';
import 'package:provider/provider.dart';

class DistanceFilter extends StatelessWidget {
  const DistanceFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final distanceLimit = context.select<SightFiltersState, RangeValues>((s) => s.distanceLimit);
    final distance = context.select<SightFiltersState, RangeValues>((s) => s.distance);
    final onChanged = context.select<SightFiltersState, ValueChanged<RangeValues>>((s) => s.changeDistance);

    return Column(
      children: [
        const _RangeLabel(),
        const SizedBox(height: 24),
        RangeSlider(
          min: distanceLimit.start,
          max: distanceLimit.end,
          values: distance,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class _RangeLabel extends StatelessWidget {
  const _RangeLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();
    final distanceLimit = context.select<SightFiltersState, RangeValues>((s) => s.distanceLimit);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppMessages.sightFilters.distanceTitle,
          style: textTheme?.text,
        ),
        Text(
          AppMessages.sightFilters.distanceRangeSliderTitle(
            start: distanceLimit.start,
            end: distanceLimit.end,
          ),
          style: textTheme?.textSecondary,
        ),
      ],
    );
  }
}

