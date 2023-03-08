import 'package:dartz/dartz.dart';
import 'package:places/domain/core/error/failure.dart';
import 'package:places/domain/core/use_case/use_case.dart';
import 'package:places/domain/places/favorite/model.dart';
import 'package:places/domain/places/favorite/repository/repository.dart';
import 'package:places/domain/places/place/entity.dart';

class AddToFavorites implements UseCase<FavoritePlaces, PlaceEntity> {
  final FavoritePlaceRepository favoritePlaceRepository;

  const AddToFavorites({
    required this.favoritePlaceRepository,
  });

  @override
  Future<Either<Failure, FavoritePlaces>> call(PlaceEntity placeEntity) {
    return favoritePlaceRepository.addToFavorites(placeEntity);
  }
}
