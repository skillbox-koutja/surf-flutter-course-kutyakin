import 'package:dartz/dartz.dart';
import 'package:places/domain/core/error/failure.dart';
import 'package:places/domain/core/use_case/use_case.dart';
import 'package:places/domain/places/favorite/model.dart';
import 'package:places/domain/places/favorite/repository/repository.dart';
import 'package:places/domain/places/favorite/use_case/reorder_favorites/use_case.dart';

class ReorderVisited implements UseCase<FavoritePlaces, ReorderArgs> {
  final FavoritePlaceRepository favoritePlaceRepository;

  const ReorderVisited({
    required this.favoritePlaceRepository,
  });

  @override
  Future<Either<Failure, FavoritePlaces>> call(ReorderArgs params) {
    return favoritePlaceRepository.reorderVisited(
      index: params.index,
      favoritePlace: params.favoritePlace,
    );
  }
}
