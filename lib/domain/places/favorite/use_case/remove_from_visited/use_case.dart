import 'package:dartz/dartz.dart';
import 'package:places/domain/core/error/failure.dart';
import 'package:places/domain/core/use_case/use_case.dart';
import 'package:places/domain/places/favorite/model.dart';
import 'package:places/domain/places/favorite/repository/repository.dart';

class RemoveFromVisited implements UseCase<void, FavoritePlace> {
  final FavoritePlaceRepository favoritePlaceRepository;

  const RemoveFromVisited({
    required this.favoritePlaceRepository,
  });

  @override
  Future<Either<Failure, void>> call(FavoritePlace favoritePlace) {
    return favoritePlaceRepository.removeFromFavorites(favoritePlace);
  }
}
