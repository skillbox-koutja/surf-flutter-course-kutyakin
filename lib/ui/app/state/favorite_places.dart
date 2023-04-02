import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/core/error/failure.dart';
import 'package:places/domain/core/use_case/use_case.dart';
import 'package:places/domain/places/favorite/model.dart';
import 'package:places/domain/places/favorite/use_case/add_to_visited/use_case.dart';
import 'package:places/domain/places/favorite/use_case/reorder_favorites/use_case.dart';
import 'package:places/domain/places/place/entity.dart';
import 'package:places/domain/places/search/filters/filters.dart';
import 'package:places/ui/app/state/favorite_places_data.dart';

class WishedPlacesState extends FavoritePlacesState<PlaceEntity> {
  WishedPlacesState({
    required super.addPlace,
    required super.getPlaces,
    required super.removePlace,
    required super.reorderPlaces,
    required super.places,
    required super.placesIds,
  });

  factory WishedPlacesState.create({
    required UseCase<FavoritePlace, PlaceEntity> addPlace,
    required UseCase<FavoritePlaces, SearchFilters> getPlaces,
    required UseCase<void, FavoritePlace> removePlace,
    required UseCase<void, ReorderArgs> reorderPlaces,
  }) {
    return WishedPlacesState(
      addPlace: addPlace,
      getPlaces: getPlaces,
      removePlace: removePlace,
      reorderPlaces: reorderPlaces,
      places: FavoritePlacesData.init(),
      placesIds: <int>{},
    );
  }

  void add(PlaceEntity placeEntity) {
    places = places.startLoading();

    addPlace(placeEntity).then((data) {
      data.fold(
        invalidLoaded,
        (favoritePlace) {
          places.data.fold(
            invalidLoaded,
            (favoritePlaces) {
              final nextPlaces = favoritePlaces.rebuild((b) => b.insert(0, favoritePlace));

              updatePlaces(Right(nextPlaces));
            },
          );
        },
      );
    });

    notifyListeners();
  }
}

class VisitedPlacesState extends FavoritePlacesState<AddToVisitedArgs> {
  VisitedPlacesState({
    required super.addPlace,
    required super.getPlaces,
    required super.removePlace,
    required super.reorderPlaces,
    required super.places,
    required super.placesIds,
  });

  factory VisitedPlacesState.create({
    required UseCase<FavoritePlace, AddToVisitedArgs> addPlace,
    required UseCase<FavoritePlaces, SearchFilters> getPlaces,
    required UseCase<void, FavoritePlace> removePlace,
    required UseCase<void, ReorderArgs> reorderPlaces,
  }) {
    return VisitedPlacesState(
      addPlace: addPlace,
      getPlaces: getPlaces,
      removePlace: removePlace,
      reorderPlaces: reorderPlaces,
      places: FavoritePlacesData.init(),
      placesIds: <int>{},
    );
  }

  void add({
    required FavoritePlace favoritePlace,
    required DateTime date,
  }) {
    places = places.startLoading();

    addPlace(AddToVisitedArgs(
      wishedPlace: favoritePlace,
      date: date,
    )).then((data) {
      data.fold(
        invalidLoaded,
        (favoritePlace) {
          places.data.fold(
            invalidLoaded,
            (favoritePlaces) {
              final nextPlaces = favoritePlaces.rebuild((b) => b.insert(0, favoritePlace));

              updatePlaces(Right(nextPlaces));
            },
          );
        },
      );
    });

    notifyListeners();
  }
}

class FavoritePlacesState<T> extends ChangeNotifier {
  UseCase<FavoritePlace, T> addPlace;
  UseCase<FavoritePlaces, SearchFilters> getPlaces;
  UseCase<void, FavoritePlace> removePlace;
  UseCase<void, ReorderArgs> reorderPlaces;

  FavoritePlacesData places;
  Set<int> placesIds;

  Timer? _debounce;

  FavoritePlacesState({
    required this.addPlace,
    required this.getPlaces,
    required this.removePlace,
    required this.places,
    required this.reorderPlaces,
    required this.placesIds,
  });

  bool isFavorite(PlaceEntity placeEntity) {
    return placesIds.contains(placeEntity.id);
  }

  FavoritePlace? findFavoritePlace(PlaceEntity placeEntity) {
    return places.data.fold(
      (failure) => null,
      (favoritePlaces) => favoritePlaces.firstWhere((p) => p.placeEntity.id == placeEntity.id),
    );
  }

  void init(SearchFilters searchFilters) {
    places = places.startLoading();

    getPlaces(searchFilters).then(updatePlaces);
  }

  void loadPlaces(SearchFilters searchFilters) {
    places = places.startLoading();

    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      getPlaces(searchFilters).then(updatePlaces);
    });

    notifyListeners();
  }

  void remove(FavoritePlace favoritePlace) {
    removePlace(favoritePlace).then((_) {
      places.data.fold(
        invalidLoaded,
        (favoritePlaces) {
          final nextPlaces = favoritePlaces.rebuild((b) => b.remove(favoritePlace));

          updatePlaces(Right(nextPlaces));
        },
      );
    });
    notifyListeners();
  }

  void removeFromState(FavoritePlace favoritePlace) {
    places.data.fold(
      (_) {},
      (favoritePlaces) {
        final nextPlaces = favoritePlaces.rebuild((b) => b.remove(favoritePlace));

        updatePlaces(Right(nextPlaces));
      },
    );
  }

  void reorder(int index, ReorderArgs args) {
    reorderPlaces(args);

    places.data.fold(
      (_) {},
      (favoritePlaces) {
        final reordered = _reorder(
          favoritePlaces: favoritePlaces,
          index: index,
          favoritePlace: args.favoritePlace,
        );

        updatePlaces(Right(reordered));
      },
    );
  }

  void updatePlaces(Either<Failure, FavoritePlaces> data) {
    places = places.finishLoading(data);
    data.fold(
      (_) => placesIds = {},
      (favoritePlaces) => placesIds = favoritePlaces.map((p) => p.placeEntity.id).toSet(),
    );
    notifyListeners();
  }

  void invalidLoaded(Failure failure) {
    places = places.finishLoading(Left(failure));

    notifyListeners();
  }

  FavoritePlaces _reorder({
    required FavoritePlaces favoritePlaces,
    required int index,
    required FavoritePlace favoritePlace,
  }) {
    return favoritePlaces.rebuild((b) => b
      ..remove(favoritePlace)
      ..insert(index, favoritePlace));
  }
}
