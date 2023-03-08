import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:places/domain/core/error/failure.dart';
import 'package:places/domain/core/use_case/use_case.dart';
import 'package:places/domain/places/favorite/model.dart';
import 'package:places/domain/places/favorite/repository/repository.dart';

class ReorderArgs extends Equatable {
  final int index;
  final FavoritePlace favoritePlace;

  @override
  List<Object?> get props => [
        index,
        favoritePlace,
      ];

  const ReorderArgs({
    required this.index,
    required this.favoritePlace,
  });
}

class ReorderFavorites implements UseCase<FavoritePlaces, ReorderArgs> {
  final FavoritePlaceRepository favoritePlaceRepository;

  const ReorderFavorites({
    required this.favoritePlaceRepository,
  });

  @override
  Future<Either<Failure, FavoritePlaces>> call(ReorderArgs params) {
    return favoritePlaceRepository.reorderFavorites(
      index: params.index,
      favoritePlace: params.favoritePlace,
    );
  }
}
