import 'package:dartz/dartz.dart';
import 'package:places/domain/core/error/failure.dart';
import 'package:places/domain/core/use_case/use_case.dart';
import 'package:places/domain/places/place/entity.dart';
import 'package:places/domain/places/place/repository/repository.dart';
import 'package:places/domain/places/search/filters/filters.dart';

class GetPlaces implements UseCase<PlaceEntities, SearchFilters> {
  final PlaceRepository _repository;

  const GetPlaces(this._repository);

  @override
  Future<Either<Failure, PlaceEntities>> call(SearchFilters filters) {
    return _repository.searchPlaces(
      geoFilter: filters.geoFilter,
      categorySelector: filters.categorySelector,
    );
  }
}
