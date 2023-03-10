import 'package:flutter/material.dart';
import 'package:places/domain/places/category/option.dart';
import 'package:places/domain/places/search/filters/filters.dart';

class PlaceFiltersState extends ChangeNotifier {
  final double _initRadius;
  final SearchFilters _initFilters;

  SearchFilters filters;
  double radius;
  RangeValues distanceLimit;

  PlaceFiltersState({
    required this.radius,
    required this.distanceLimit,
    required this.filters,
  })  : _initRadius = radius,
        _initFilters = filters;

  void toggleCategory(CategoryOption category) {
    filters = filters.toggleCategory(category);

    notifyListeners();
  }

  void changeRadius(double r) {
    radius = r;
    filters = filters.editRadius(radius);
debugPrint('changeRadius $r');
    notifyListeners();
  }

  void clear() {
    radius = _initRadius;
    filters = _initFilters;

    notifyListeners();
  }
}
