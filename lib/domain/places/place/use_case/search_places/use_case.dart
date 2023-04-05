import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:places/domain/core/error/failure.dart';
import 'package:places/domain/core/use_case/use_case.dart';
import 'package:places/domain/geo/filter.dart';
import 'package:places/domain/places/category/selector.dart';
import 'package:places/domain/places/place/entity.dart';
import 'package:places/domain/places/place/repository/repository.dart';

class SearchPlaceFilters extends Equatable {
  final String nameFilter;
  final GeoFilter geoFilter;
  final CategorySelector categorySelector;

  @override
  List<Object> get props => [
        nameFilter,
        geoFilter,
        categorySelector,
      ];

  const SearchPlaceFilters({
    required this.nameFilter,
    required this.geoFilter,
    required this.categorySelector,
  });
}

class SearchPlaces implements UseCase<PlaceEntities, SearchPlaceFilters> {
  final PlaceRepository _repository;

  const SearchPlaces(this._repository);

  @override
  Future<Either<Failure, PlaceEntities>> call(SearchPlaceFilters filters) {
    return _repository.searchPlaces(
      nameFilter: filters.nameFilter,
      geoFilter: filters.geoFilter,
      categorySelector: filters.categorySelector,
    );
  }
}
