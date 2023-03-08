import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/domain/geo/filter.dart';
import 'package:places/domain/geo/geo.dart';
import 'package:places/domain/places/category/option.dart';
import 'package:places/domain/places/category/selector.dart';

part 'filters.freezed.dart';

@freezed
class SearchFilters with _$SearchFilters {
  const factory SearchFilters({
    required GeoFilter geoFilter,
    required CategorySelector categorySelector,
  }) = _SearchFilters;

  const SearchFilters._();

  SearchFilters editRadius (double radius) {
    return copyWith(
      geoFilter: geoFilter.editRadius(radius),
    );
  }

  SearchFilters changeGeoLocation (Geo geo) {
    return copyWith(
      geoFilter: geoFilter.changeGeoLocation(geo),
    );
  }

  SearchFilters toggleCategory(CategoryOption category) {
    return copyWith(
      categorySelector: categorySelector.toggle(category),
    );
  }
}