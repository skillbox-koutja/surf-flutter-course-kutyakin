import 'package:dartz/dartz.dart';
import 'package:places/domain/core/error/failure.dart';
import 'package:places/domain/core/use_case/use_case.dart';
import 'package:places/domain/places/favorite/model.dart';
import 'package:places/domain/places/favorite/repository/repository.dart';

class AddToVisited implements UseCase<FavoritePlaces, FavoritePlace> {
  final FavoritePlaceRepository favoritePlaceRepository;

  const AddToVisited({
    required this.favoritePlaceRepository,
  });

  @override
  Future<Either<Failure, FavoritePlaces>> call(FavoritePlace favoritePlace) {
    if (!favoritePlace.canDone) {
      return Future.value(Left(InvalidModel()));
    }

    return favoritePlaceRepository.addToVisited(favoritePlace);
  }
}
