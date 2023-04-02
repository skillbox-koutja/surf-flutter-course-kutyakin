import 'package:dartz/dartz.dart';
import 'package:places/domain/core/error/failure.dart';
import 'package:places/domain/places/favorite/model.dart';
import 'package:places/domain/places/search/filters/filters.dart';

abstract class FavoritePlaceRepository {
  Future<Either<Failure, FavoritePlace>> addToFavorites(FavoritePlace favoritePlace);

  Future<Either<Failure, void>> removeFromFavorites(FavoritePlace favoritePlace);

  Future<Either<Failure, FavoritePlaces>> getFavoritePlaces(SearchFilters searchFilters);

  Future<Either<Failure, void>> reorderFavorites({
    required int targetPriority,
    required FavoritePlace favoritePlace,
  });

  Future<Either<Failure, FavoritePlaces>> getVisitedPlaces(SearchFilters searchFilters);

  Future<Either<Failure, void>> reorderVisited({
    required int targetPriority,
    required FavoritePlace favoritePlace,
  });
}
