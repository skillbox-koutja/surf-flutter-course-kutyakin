import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/sight/category/value.dart';
import 'package:places/domain/sight/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/icons/svg_icons.dart';
import 'package:places/ui/sight/filters/category/filter.dart';
import 'package:places/ui/sight/filters/distance/filter.dart';

class SightFiltersScreen extends StatefulWidget {
  final void Function() onClose;

  const SightFiltersScreen({required this.onClose, Key? key}) : super(key: key);

  @override
  State<SightFiltersScreen> createState() => _SightFiltersScreenState();
}

const double _initDistance = 100;

class _SightFiltersScreenState extends State<SightFiltersScreen> {
  double _distance = _initDistance;
  late List<CategoryFilterValue> _sightFilterCategories = getCategoryFilterValues();
  late int _sightsCount;

  @override
  void initState() {
    super.initState();

    _sightsCount = calcSightsCount(
      sightFilterCategories: _sightFilterCategories,
      distance: _distance,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 56 + MediaQuery.of(context).padding.top),
            _Header(
              clearFilters: clearFilters,
              onClose: widget.onClose,
            ),
            SizedBox(
              width: double.infinity,
              child: CategoryFilter(
                onChanged: toggleCategoryFilter,
                sightFilterCategories: _sightFilterCategories,
              ),
            ),
            const SizedBox(height: 60),
            DistanceFilter(
              distance: _distance,
              onChanged: onDistanceChanged,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  print(AppMessages.sightFilters.showSightsCountText(_sightsCount)); // ignore: avoid_print
                },
                child: Text(
                  AppMessages.sightFilters.showSightsCountText(_sightsCount),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom),
          ],
        ),
      ),
    );
  }

  void toggleCategoryFilter(CategoryFilterValue value) {
    value.toggle();
    final sightFilterCategories = [..._sightFilterCategories];
    final sightsCount = calcSightsCount(
      sightFilterCategories: sightFilterCategories,
      distance: _distance,
    );

    setState(() {
      _sightFilterCategories = sightFilterCategories;
      _sightsCount = sightsCount;
    });
  }

  void onDistanceChanged(double value) {
    final sightsCount = calcSightsCount(
      sightFilterCategories: _sightFilterCategories,
      distance: value,
    );

    setState(() {
      _distance = value;
      _sightsCount = sightsCount;
    });
  }

  void clearFilters() {
    final sightFilterCategories = getCategoryFilterValues();
    final sightsCount = calcSightsCount(
      sightFilterCategories: sightFilterCategories,
      distance: _initDistance,
    );

    setState(() {
      _distance = _initDistance;
      _sightsCount = sightsCount;
      _sightFilterCategories = sightFilterCategories;
    });
  }

  int calcSightsCount({
    required List<CategoryFilterValue> sightFilterCategories,
    required double distance,
  }) {
    final types = sightFilterCategories.where((element) => element.selected).map((element) => element.type).toList();

    final filters = <bool Function(Sight sight)>[
      (sight) => sight.getDistance(centerPoint).toMeters <= distance,
    ];

    if (types.isNotEmpty) {
      filters.add((sight) => types.contains(sight.type));
    }

    return sights.where((sight) {
      for (final filter in filters) {
        if (!filter(sight)) {
          return false;
        }
      }

      return true;
    }).length;
  }
}

class _Header extends StatelessWidget {
  final void Function() onClose;
  final void Function() clearFilters;

  const _Header({
    required this.onClose,
    required this.clearFilters,
    Key? key,
  }) : super(key: key);

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
