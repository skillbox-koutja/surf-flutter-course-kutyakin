import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/core/utils/extensions/build_context_ext.dart';
import 'package:places/ui/app/state/place_filters.dart';
import 'package:places/ui/app/state/places.dart';
import 'package:places/ui/components/icons/svg_icons.dart';
import 'package:places/ui/components/progress_indicator/circular.dart';
import 'package:places/ui/sight/filters/category/filter.dart';
import 'package:places/ui/sight/filters/distance/filter.dart';
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
        padding: const EdgeInsets.all(8.0).copyWith(
          bottom: 8 + MediaQuery.of(context).padding.bottom,
        ),
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
    final colorsTheme = context.themeColors;
    final textTheme = context.themeTextStyles;
    final clearFilters = context.read<PlaceFiltersState>().clear;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onClose,
            child: ChevronLeftSvgIcon(
              color: colorsTheme.icon,
            ),
          ),
          GestureDetector(
            onTap: clearFilters,
            child: Text(
              AppMessages.sightFilters.clearTitle,
              style: textTheme.text?.copyWith(
                color: colorsTheme.green,
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

  const _ApplyFiltersButton({
    required this.onClose,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final placesData = context.select<PlacesState, PlacesData>((s) => s.places);

    if (placesData.loading) {
      return const SizedBox(
        width: double.infinity,
        child: _LoaderButton(),
      );
    }

    return SizedBox(
      width: double.infinity,
      child: placesData.data.fold(
        (failure) => const _FailedLoadButton(),
        (places) => ElevatedButton(
          onPressed: onClose,
          child: Text(
            AppMessages.sightFilters.showSightsCountText(places.length),
          ),
        ),
      ),
    );
  }
}

class _LoaderButton extends StatelessWidget {
  const _LoaderButton();

  @override
  Widget build(BuildContext context) {
    final textTheme = context.themeTextStyles;

    return ElevatedButton(
      onPressed: null,
      child: SizedBox.square(
        child: AppCircularProgressIndicator.defaultLoader(),
        dimension: textTheme.text?.fontSize,
      ),
    );
  }
}

class _FailedLoadButton extends StatelessWidget {
  const _FailedLoadButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      child: Text(
        AppMessages.sightFilters.failedToLoadMessage,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
