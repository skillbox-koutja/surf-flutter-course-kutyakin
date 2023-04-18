import 'package:dartz/dartz.dart';
import 'package:places/domain/core/error/failure.dart';
import 'package:places/domain/core/use_case/use_case.dart';
import 'package:places/domain/places/favorite/model.dart';
import 'package:places/domain/places/favorite/repository/repository.dart';
import 'package:places/domain/places/search/filters/filters.dart';

class GetFavoritePlaces implements UseCase<FavoritePlaces, SearchFilters> {
  final FavoritePlaceRepository _repository;

  const GetFavoritePlaces(this._repository);

  @override
  Future<Either<Failure, FavoritePlaces>> call(SearchFilters searchFilters) {
    return _repository.getFavoritePlaces(searchFilters);
  }
}
