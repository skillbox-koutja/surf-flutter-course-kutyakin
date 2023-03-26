import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/core/error/failure.dart';
import 'package:places/domain/places/place/entity.dart';
import 'package:places/domain/places/place/use_case/create/use_case.dart';
import 'package:places/domain/places/place/use_case/edit/use_case.dart';
import 'package:places/domain/places/place/use_case/get_place_details/use_case.dart';
import 'package:places/domain/places/place/use_case/get_places/use_case.dart';
import 'package:places/domain/places/place/use_case/search_places/use_case.dart';
import 'package:places/domain/places/search/filters/filters.dart';

class PlacesState extends ChangeNotifier {
  CreatePlaceEntity createPlaceEntity;
  EditPlaceEntity editPlaceEntity;
  GetPlaceDetails getPlaceDetails;
  GetPlaces getPlaces;
  SearchPlaces searchPlaces;

  PlacesData places;

  Timer? _debounce;

  PlacesState({
    required this.createPlaceEntity,
    required this.editPlaceEntity,
    required this.getPlaceDetails,
    required this.getPlaces,
    required this.searchPlaces,
    required this.places,
  });

  factory PlacesState.create({
    required CreatePlaceEntity createPlaceEntity,
    required EditPlaceEntity editPlaceEntity,
    required GetPlaceDetails getPlaceDetails,
    required GetPlaces getPlaces,
    required SearchPlaces searchPlaces,
  }) {
    return PlacesState(
      createPlaceEntity: createPlaceEntity,
      editPlaceEntity: editPlaceEntity,
      getPlaceDetails: getPlaceDetails,
      getPlaces: getPlaces,
      searchPlaces: searchPlaces,
      places: PlacesData.init(),
    );
  }

  void init(SearchFilters searchFilters) {
    places = PlacesData.loading();

    getPlaces(searchFilters).then((data) {
      places = PlacesData.loaded(data);
      notifyListeners();
    });
  }

  void loadPlaces(SearchFilters searchFilters) {
    places = PlacesData.loading();

    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      getPlaces(searchFilters).then((data) {
        places = PlacesData.loaded(data);
        notifyListeners();
      });
    });

    notifyListeners();
  }
}

class PlacesData {
  final bool loading;
  final bool loaded;
  final Either<Failure, PlaceEntities> data;

  const PlacesData({
    required this.data,
    required this.loading,
    required this.loaded,
  });

  factory PlacesData.init() {
    return PlacesData(
      data: Right(BuiltList(<PlaceEntity>[])),
      loading: false,
      loaded: false,
    );
  }

  factory PlacesData.loading() {
    return PlacesData(
      data: Right(BuiltList(<PlaceEntity>[])),
      loading: true,
      loaded: false,
    );
  }

  factory PlacesData.loaded(Either<Failure, PlaceEntities> data) {
    return PlacesData(
      data: data,
      loading: false,
      loaded: true,
    );
  }
}

