import 'package:flutter/material.dart';
import 'package:places/data/places/data_source/remote.dart';
import 'package:places/data/places/repository/favorite_place_repository.dart';
import 'package:places/data/places/repository/place_repository.dart';
import 'package:places/data/places/repository/search_history_repository.dart';
import 'package:places/domain/places/favorite/use_case/add_to_favorites/use_case.dart';
import 'package:places/domain/places/favorite/use_case/add_to_visited/use_case.dart';
import 'package:places/domain/places/favorite/use_case/get_favorite_places/use_case.dart';
import 'package:places/domain/places/favorite/use_case/get_visited_places/use_case.dart';
import 'package:places/domain/places/favorite/use_case/remove_from_favorites/use_case.dart';
import 'package:places/domain/places/favorite/use_case/remove_from_visited/use_case.dart';
import 'package:places/domain/places/favorite/use_case/reorder_favorites/use_case.dart';
import 'package:places/domain/places/favorite/use_case/reorder_visited/use_case.dart';
import 'package:places/domain/places/place/use_case/create/use_case.dart';
import 'package:places/domain/places/place/use_case/edit/use_case.dart';
import 'package:places/domain/places/place/use_case/get_place_details/use_case.dart';
import 'package:places/domain/places/place/use_case/get_places/use_case.dart';
import 'package:places/domain/places/place/use_case/search_places/use_case.dart';
import 'package:places/domain/places/search/filters/filters.dart';
import 'package:places/domain/places/search/history/use_case/add/use_case.dart';
import 'package:places/domain/places/search/history/use_case/clear/use_case.dart';
import 'package:places/domain/places/search/history/use_case/get_history/use_case.dart';
import 'package:places/domain/places/search/history/use_case/remove/use_case.dart';
import 'package:places/ui/app/state/favorite_places.dart';
import 'package:places/ui/app/state/place_filters.dart';
import 'package:places/ui/app/state/place_search.dart';
import 'package:places/ui/app/state/places.dart';
import 'package:places/ui/app/state/settings_state.dart';
import 'package:provider/provider.dart';

Map<Object, Create<Object>> setupStates({
  required PlaceRemoteDataSource remoteDataSource,
  required RangeValues distanceLimit,
  required SearchFilters searchFilters,
}) {
  return {
    SettingsState: (_) => SettingsState(),
    PlaceFiltersState: (_) => PlaceFiltersState(
          radius: searchFilters.geoFilter.radius,
          distanceLimit: distanceLimit,
          filters: searchFilters,
        ),
    ..._setupPlacesStates(remoteDataSource: remoteDataSource),
    ..._setupFavoritePlacesStates(),
  };
}

Map<Object, Create<Object>> _setupPlacesStates({
  required PlaceRemoteDataSource remoteDataSource,
}) {
  final placeRepository = PlaceRepositoryImpl(
    remoteDataSource: remoteDataSource,
  );
  final searchHistoryRepository = SearchHistoryRepositoryImpl();

  return {
    PlacesState: (_) => PlacesState.create(
          createPlaceEntity: CreatePlaceEntity(placeRepository: placeRepository),
          editPlaceEntity: EditPlaceEntity(placeRepository: placeRepository),
          getPlaceDetails: GetPlaceDetails(placeRepository: placeRepository),
          getPlaces: GetPlaces(placeRepository: placeRepository),
          searchPlaces: SearchPlaces(placeRepository: placeRepository),
        ),
    PlaceSearchState: (_) => PlaceSearchState.create(
          addSearchHistory: AddSearchHistory(searchHistoryRepository: searchHistoryRepository),
          getSearchHistory: GetSearchHistory(searchHistoryRepository: searchHistoryRepository),
          clearSearchHistory: ClearSearchHistory(searchHistoryRepository: searchHistoryRepository),
          removeSearchHistory: RemoveSearchHistory(searchHistoryRepository: searchHistoryRepository),
          searchPlaces: SearchPlaces(placeRepository: placeRepository),
        ),
  };
}

Map<Object, Create<Object>> _setupFavoritePlacesStates() {
  final favoritePlaceRepository = FavoritePlaceRepositoryImpl.create();

  return {
    WishedPlacesState: (_) => WishedPlacesState.create(
          addPlace: AddToFavorites(favoritePlaceRepository: favoritePlaceRepository),
          getPlaces: GetFavoritePlaces(favoritePlaceRepository: favoritePlaceRepository),
          removePlace: RemoveFromFavorites(favoritePlaceRepository: favoritePlaceRepository),
          reorderPlaces: ReorderFavorites(favoritePlaceRepository: favoritePlaceRepository),
        ),
    VisitedPlacesState: (_) => VisitedPlacesState.create(
          addPlace: AddToVisited(favoritePlaceRepository: favoritePlaceRepository),
          getPlaces: GetVisitedPlaces(favoritePlaceRepository: favoritePlaceRepository),
          removePlace: RemoveFromVisited(favoritePlaceRepository: favoritePlaceRepository),
          reorderPlaces: ReorderVisited(favoritePlaceRepository: favoritePlaceRepository),
        ),
  };
}
