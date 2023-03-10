import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/core/error/failure.dart';
import 'package:places/domain/core/use_case/use_case.dart';
import 'package:places/domain/places/favorite/model.dart';
import 'package:places/domain/places/favorite/use_case/reorder_favorites/use_case.dart';
import 'package:places/domain/places/place/entity.dart';
import 'package:places/domain/places/search/filters/filters.dart';

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
    required UseCase<FavoritePlaces, PlaceEntity> addPlace,
    required UseCase<FavoritePlaces, SearchFilters> getPlaces,
    required UseCase<FavoritePlaces, FavoritePlace> removePlace,
    required UseCase<FavoritePlaces, ReorderArgs> reorderPlaces,
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
    addPlace(placeEntity).then(updatePlaces);
    notifyListeners();
  }
}

class VisitedPlacesState extends FavoritePlacesState<FavoritePlace> {
  VisitedPlacesState({
    required super.addPlace,
    required super.getPlaces,
    required super.removePlace,
    required super.reorderPlaces,
    required super.places,
    required super.placesIds,
  });

  factory VisitedPlacesState.create({
    required UseCase<FavoritePlaces, FavoritePlace> addPlace,
    required UseCase<FavoritePlaces, SearchFilters> getPlaces,
    required UseCase<FavoritePlaces, FavoritePlace> removePlace,
    required UseCase<FavoritePlaces, ReorderArgs> reorderPlaces,
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
}

class FavoritePlacesState<T> extends ChangeNotifier {
  UseCase<FavoritePlaces, T> addPlace;
  UseCase<FavoritePlaces, SearchFilters> getPlaces;
  UseCase<FavoritePlaces, FavoritePlace> removePlace;
  UseCase<FavoritePlaces, ReorderArgs> reorderPlaces;

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

  void init(SearchFilters searchFilters) {
    places = FavoritePlacesData.loading();

    getPlaces(searchFilters).then((data) {
      places = FavoritePlacesData.loaded(data);
    });
  }

  void loadPlaces(SearchFilters searchFilters) {
    places = FavoritePlacesData.loading();

    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      getPlaces(searchFilters).then(updatePlaces);
    });

    notifyListeners();
  }

  void remove(FavoritePlace favoritePlace) {
    removePlace(favoritePlace).then(updatePlaces);
    notifyListeners();
  }

  void reorder(ReorderArgs args) {
    reorderPlaces(args).then(updatePlaces);
    notifyListeners();
  }

  void updatePlaces(Either<Failure, FavoritePlaces> data) {
    places = FavoritePlacesData.loaded(data);
    data.fold(
      (_) => placesIds = {},
      (favoritePlaces) => placesIds = favoritePlaces.map((p) => p.placeEntity.id).toSet(),
    );
    notifyListeners();
  }
}

class FavoritePlacesData {
  final bool loading;
  final bool loaded;
  final Either<Failure, FavoritePlaces> data;

  const FavoritePlacesData({
    required this.data,
    required this.loading,
    required this.loaded,
  });

  factory FavoritePlacesData.init() {
    return FavoritePlacesData(
      data: Right(emptyFavoritePlaces),
      loading: false,
      loaded: false,
    );
  }

  factory FavoritePlacesData.loading() {
    return FavoritePlacesData(
      data: Right(emptyFavoritePlaces),
      loading: true,
      loaded: false,
    );
  }

  factory FavoritePlacesData.loaded(Either<Failure, FavoritePlaces> data) {
    return FavoritePlacesData(
      data: data,
      loading: false,
      loaded: true,
    );
  }
}
