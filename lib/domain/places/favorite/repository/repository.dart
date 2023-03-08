import 'package:dartz/dartz.dart';
import 'package:places/domain/core/error/failure.dart';
import 'package:places/domain/places/favorite/model.dart';
import 'package:places/domain/places/place/entity.dart';
import 'package:places/domain/places/search/filters/filters.dart';

abstract class FavoritePlaceRepository {
  Future<Either<Failure, FavoritePlaces>> getFavoritePlaces(SearchFilters searchFilters);

  Future<Either<Failure, FavoritePlaces>> addToFavorites(PlaceEntity placeEntity);

  Future<Either<Failure, FavoritePlaces>> removeFromFavorites(FavoritePlace favoritePlace);

  Future<Either<Failure, FavoritePlaces>> reorderFavorites({
    required int index,
    required FavoritePlace favoritePlace,
  });

  Future<Either<Failure, FavoritePlaces>> getVisitedPlaces(SearchFilters searchFilters);

  Future<Either<Failure, FavoritePlaces>> addToVisited(FavoritePlace favoritePlace);

  Future<Either<Failure, FavoritePlaces>> removeFromVisited(FavoritePlace favoritePlace);

  Future<Either<Failure, FavoritePlaces>> reorderVisited({
    required int index,
    required FavoritePlace favoritePlace,
  });
}
