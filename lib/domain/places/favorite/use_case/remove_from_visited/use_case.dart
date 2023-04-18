import 'package:dartz/dartz.dart';
import 'package:places/domain/core/error/failure.dart';
import 'package:places/domain/core/use_case/use_case.dart';
import 'package:places/domain/places/favorite/model.dart';
import 'package:places/domain/places/favorite/repository/repository.dart';

class RemoveFromVisited implements UseCase<void, FavoritePlace> {
  final FavoritePlaceRepository _repository;

  const RemoveFromVisited(this._repository);

  @override
  Future<Either<Failure, void>> call(FavoritePlace favoritePlace) {
    return _repository.removeFromFavorites(favoritePlace);
  }
}
