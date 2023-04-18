import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:places/domain/core/error/failure.dart';
import 'package:places/domain/core/use_case/use_case.dart';
import 'package:places/domain/places/favorite/model.dart';
import 'package:places/domain/places/favorite/repository/repository.dart';

class ReorderArgs extends Equatable {
  final int targetPriority;
  final FavoritePlace favoritePlace;

  @override
  List<Object?> get props => [
        targetPriority,
        favoritePlace,
      ];

  const ReorderArgs({
    required this.targetPriority,
    required this.favoritePlace,
  });
}

class ReorderFavorites implements UseCase<void, ReorderArgs> {
  final FavoritePlaceRepository _repository;

  const ReorderFavorites(this._repository);

  @override
  Future<Either<Failure, void>> call(ReorderArgs params) {
    return _repository.reorderFavorites(
      targetPriority: params.targetPriority,
      favoritePlace: params.favoritePlace,
    );
  }
}
