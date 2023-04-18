import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:places/domain/core/error/failure.dart';
import 'package:places/domain/core/use_case/use_case.dart';
import 'package:places/domain/places/favorite/model.dart';
import 'package:places/domain/places/favorite/repository/repository.dart';

class AddToVisitedArgs extends Equatable {
  final DateTime date;
  final FavoritePlace wishedPlace;

  @override
  List<Object?> get props => [
    date,
    wishedPlace,
  ];

  const AddToVisitedArgs({
    required this.date,
    required this.wishedPlace,
  });
}

class AddToVisited implements UseCase<FavoritePlace, AddToVisitedArgs> {
  final FavoritePlaceRepository _repository;

  const AddToVisited(this._repository);

  @override
  Future<Either<Failure, FavoritePlace>> call(AddToVisitedArgs args) {
    final wished = args.wishedPlace;
    if (!wished.canDone) {
      return Future.value(Left(InvalidModel()));
    }

    _repository.removeFromFavorites(wished);

    final visited = wished.done(args.date);

    return _repository.addToFavorites(visited);
  }
}
