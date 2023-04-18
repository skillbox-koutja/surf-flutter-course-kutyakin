import 'package:flutter/material.dart';
import 'package:places/domain/places/category/option.dart';
import 'package:places/domain/places/search/filters/filters.dart';
import 'package:places/domain/user_preferences/model.dart';

class PlaceFiltersState extends ChangeNotifier {
  final double _initRadius;
  final SearchFilters _initFilters;
  final void Function(PlaceFiltersState state) _onChange;

  SearchFilters filters;
  double radius;
  RangeValues distanceLimit;

  PlaceFiltersState({
    required this.radius,
    required this.distanceLimit,
    required this.filters,
    required void Function(PlaceFiltersState state) onChange,
  })  : _initRadius = radius,
        _initFilters = filters,
        _onChange = onChange;

  void toggleCategory(CategoryOption category) {
    filters = filters.toggleCategory(category);

    _save();
  }

  void changeRadius(double r) {
    radius = r;
    filters = filters.editRadius(radius);

    _save();
  }

  void clear() {
    radius = _initRadius;
    filters = _initFilters;

    _save();
  }

  void changeUserPreferences(UserPreferencesModel userPreferences) {
    filters = userPreferences.allowedUseLocation ? filters.enableGeoFilter() : filters.disableGeoFilter();

    _save();
  }

  void _save() {
    _onChange(this);

    notifyListeners();
  }
}
