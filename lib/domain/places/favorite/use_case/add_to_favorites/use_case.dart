import 'package:dartz/dartz.dart';
import 'package:places/domain/core/error/failure.dart';
import 'package:places/domain/core/use_case/use_case.dart';
import 'package:places/domain/places/favorite/model.dart';
import 'package:places/domain/places/favorite/repository/repository.dart';
import 'package:places/domain/places/place/entity.dart';

class AddToFavorites implements UseCase<FavoritePlace, PlaceEntity> {
  final FavoritePlaceRepository favoritePlaceRepository;

  const AddToFavorites({
    required this.favoritePlaceRepository,
  });

  @override
  Future<Either<Failure, FavoritePlace>> call(PlaceEntity placeEntity) {
    const priority = 1;
    final favoritePlace = FavoritePlace.certainPlanned(
      placeEntity: placeEntity,
      date: DateTime.now(),
      priority: priority,
    );

    return favoritePlaceRepository.addToFavorites(favoritePlace);
  }
}
