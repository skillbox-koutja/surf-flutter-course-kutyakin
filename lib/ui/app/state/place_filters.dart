import 'package:flutter/material.dart';
import 'package:places/domain/places/category/option.dart';
import 'package:places/domain/places/search/filters/filters.dart';
import 'package:places/domain/user_preferences/model.dart';
import 'package:places/domain/user_preferences/repository.dart';

class PlaceFiltersState extends ChangeNotifier {
  final UserPreferencesRepository userPreferencesRepository;
  final double _initRadius;
  final SearchFilters _initFilters;

  UserPreferencesModel userPreferences;
  SearchFilters filters;
  double radius;
  RangeValues distanceLimit;

  PlaceFiltersState({
    required this.userPreferences,
    required this.userPreferencesRepository,
    required this.radius,
    required this.distanceLimit,
    required this.filters,
  })  : _initRadius = radius,
        _initFilters = filters;

  void toggleCategory(CategoryOption category) {
    filters = filters.toggleCategory(category);

    _saveUserPreferences(userPreferences.selectCategories(
      filters.categorySelector.selected,
    ));
  }

  void changeRadius(double r) {
    radius = r;
    filters = filters.editRadius(radius);

    _saveUserPreferences(userPreferences.editRadius(
      radius,
    ));
  }

  void clear() {
    radius = _initRadius;
    filters = _initFilters;

    _saveUserPreferences(userPreferences.clearFilters(
      radius: _initRadius,
      selectedCategories: filters.categorySelector.selected,
    ));
  }

  void _saveUserPreferences(UserPreferencesModel model) {
    userPreferences = model;
    userPreferencesRepository.save(userPreferences);
    notifyListeners();
  }
}
