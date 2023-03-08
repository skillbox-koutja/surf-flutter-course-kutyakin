import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/ui/app/state/place_filters.dart';
import 'package:provider/provider.dart';

class DistanceFilter extends StatelessWidget {
  const DistanceFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _RangeLabel(),
        SizedBox(height: 24),
        _RadiusSlider(),
      ],
    );
  }
}

class _RadiusSlider extends StatelessWidget {
  const _RadiusSlider();

  @override
  Widget build(BuildContext context) {
    final distanceLimit = context.select<PlaceFiltersState, RangeValues>((s) => s.distanceLimit);
    final radius = context.select<PlaceFiltersState, double>((s) => s.radius);
    final onChanged = context.select<PlaceFiltersState, ValueChanged<double>>((s) => s.changeRadius);

    return Slider(
      min: distanceLimit.start,
      max: distanceLimit.end,
      value: radius,
      onChanged: onChanged,
      label: AppMessages.sightFilters.distanceSliderTitle(radius),
    );
  }
}

class _RangeLabel extends StatelessWidget {
  const _RangeLabel();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();
    final distanceLimit = context.select<PlaceFiltersState, RangeValues>((s) => s.distanceLimit);

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

