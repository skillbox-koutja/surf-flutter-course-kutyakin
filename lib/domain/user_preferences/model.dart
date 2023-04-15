import 'package:built_collection/built_collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/assets/theme/theme.dart';
import 'package:places/domain/geo/geo.dart';
import 'package:places/domain/places/category/option.dart';

part 'model.freezed.dart';

@freezed
class UserPreferencesModel with _$UserPreferencesModel {
  bool get isDark => themeMode == AppThemeMode.dark;

  const factory UserPreferencesModel({
    required AppThemeMode themeMode,
    required double radius,
    required BuiltList<CategoryOption> selectedCategories,
    required bool seenOnboarding,
    required Geo location,
    @Default(false) bool allowedUseLocation,
  }) = _UserPreferencesModel;

  const UserPreferencesModel._();

  UserPreferencesModel toDarkMode() {
    return copyWith(themeMode: AppThemeMode.dark);
  }

  UserPreferencesModel toLightMode() {
    return copyWith(themeMode: AppThemeMode.light);
  }

  UserPreferencesModel makeSeenOnboarding() {
    return copyWith(seenOnboarding: true);
  }

  UserPreferencesModel editRadius(double radius) {
    return copyWith(radius: radius);
  }

  UserPreferencesModel selectCategories(BuiltList<CategoryOption> selectedCategories) {
    return copyWith(selectedCategories: selectedCategories);
  }

  UserPreferencesModel clearFilters({
    required double radius,
    required BuiltList<CategoryOption> selectedCategories,
  }) {
    return copyWith(
      radius: radius,
      selectedCategories: selectedCategories,
    );
  }

  UserPreferencesModel allowUseLocation() {
    return copyWith(
      allowedUseLocation: true,
    );
  }

  UserPreferencesModel denyUseLocation() {
    return copyWith(
      allowedUseLocation: false,
    );
  }

  UserPreferencesModel editLocation(Geo location) {
    return copyWith(
      location: location,
    );
  }
}
