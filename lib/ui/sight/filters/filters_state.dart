import 'package:flutter/material.dart';
import 'package:places/domain/sight/category/value.dart';
import 'package:places/domain/sight/sight.dart';
import 'package:places/mocks.dart';

typedef ApplyFilters = List<Sight> Function(List<Sight> sights);
typedef CategoryFilters = List<CategoryFilterValue>;
typedef Filter = bool Function(Sight sight);

class SightFiltersState extends ChangeNotifier {
  late final List<CategoryFilterValue> _initSightFilterCategories;

  RangeValues distance;
  RangeValues distanceLimit;

  List<CategoryFilterValue> sightFilterCategories;

  List<Sight> filteredSights = [...sights];

  SightFiltersState({
    required this.distance,
    required this.distanceLimit,
    required this.sightFilterCategories,
  })  : _initSightFilterCategories = sightFilterCategories;

  void toggleCategoryFilter(CategoryFilterValue category) {
    final newCategory = category.toggle();
    sightFilterCategories = [...sightFilterCategories];
    final index = sightFilterCategories.indexOf(category);
    sightFilterCategories.replaceRange(index, index + 1, [newCategory]);

    applyFilters();
  }

  void changeDistance(RangeValues value) {
    distance = value;

    applyFilters();
  }

  void clear() {
    distance = distanceLimit;
    sightFilterCategories = _initSightFilterCategories;

    applyFilters();
  }

  void applyFilters() {
    final types = sightFilterCategories.where((element) => element.selected).map((element) => element.type).toList();

    final filters = <Filter>[
      (sight) {
        final value = sight.getDistance(centerPoint).toMeters;

        return distance.start <= value && value <= distance.end;
      },
    ];

    if (types.isNotEmpty) {
      filters.add((sight) => types.contains(sight.type));
    }

    filteredSights = sights.where((sight) {
      for (final filter in filters) {
        if (!filter(sight)) {
          return false;
        }
      }

      return true;
    }).toList();

    notifyListeners();
  }
}
