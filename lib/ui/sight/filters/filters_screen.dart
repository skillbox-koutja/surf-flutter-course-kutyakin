import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/ui/icons/svg_icons.dart';
import 'package:places/ui/sight/filters/category/filter.dart';
import 'package:places/ui/sight/filters/distance/filter.dart';

class SightFiltersScreen extends StatefulWidget {
  const SightFiltersScreen({Key? key}) : super(key: key);

  @override
  State<SightFiltersScreen> createState() => _SightFiltersScreenState();
}

class _SightFiltersScreenState extends State<SightFiltersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 56 + MediaQuery.of(context).padding.top),
            const _Header(),
            const SizedBox(
              width: double.infinity,
              child: CategoryFilter(),
            ),
            const SizedBox(height: 60),
            const DistanceFilter(),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  print(AppMessages.sightFilters.showSightsCountText(190)); // ignore: avoid_print
                },
                child: Text(
                  AppMessages.sightFilters.showSightsCountText(190),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorsTheme = theme.extension<CustomColors>();
    final textTheme = theme.extension<CustomTextStyles>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ChevronLeftSvgIcon(
            color: colorsTheme?.icon,
          ),
          Text(
            AppMessages.sightFilters.clearTitle,
            style: textTheme?.text?.copyWith(
              color: colorsTheme?.green,
            ),
          ),
        ],
      ),
    );
  }
}
