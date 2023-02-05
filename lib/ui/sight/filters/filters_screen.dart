import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/sight/sight.dart';
import 'package:places/ui/icons/svg_icons.dart';
import 'package:places/ui/sight/filters/category/filter.dart';
import 'package:places/ui/sight/filters/distance/filter.dart';
import 'package:places/ui/sight/filters/filters_state.dart';
import 'package:provider/provider.dart';

class SightFiltersScreen extends StatelessWidget {
  final VoidCallback onClose;

  const SightFiltersScreen({required this.onClose, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 56 + MediaQuery.of(context).padding.top),
            _Header(
              onClose: onClose,
            ),
            Flexible(
              child: ListView(
                children: const [
                  SizedBox(
                    width: double.infinity,
                    child: CategoryFilter(),
                  ),
                  SizedBox(height: 60),
                  DistanceFilter(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _ApplyFiltersButton(
          onClose: onClose,
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final VoidCallback onClose;

  const _Header({
    required this.onClose,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorsTheme = theme.extension<CustomColors>();
    final textTheme = theme.extension<CustomTextStyles>();
    final clearFilters = context.select<SightFiltersState, VoidCallback>((s) => s.clear);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onClose,
            child: ChevronLeftSvgIcon(
              color: colorsTheme?.icon,
            ),
          ),
          GestureDetector(
            onTap: clearFilters,
            child: Text(
              AppMessages.sightFilters.clearTitle,
              style: textTheme?.text?.copyWith(
                color: colorsTheme?.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ApplyFiltersButton extends StatelessWidget {
  final VoidCallback onClose;

  const _ApplyFiltersButton({required this.onClose, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filteredSights = context.select<SightFiltersState, List<Sight>>((s) => s.filteredSights);
    final sightsCount = filteredSights.length;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onClose,
        child: Text(
          AppMessages.sightFilters.showSightsCountText(sightsCount),
        ),
      ),
    );
  }
}
