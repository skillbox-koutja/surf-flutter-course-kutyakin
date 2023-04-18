import 'package:flutter/material.dart';
import 'package:places/data/device_location/data_source.dart';
import 'package:places/data/places/data_source/remote.dart';
import 'package:places/data/places/repository/place_repository.dart';
import 'package:places/domain/places/favorite/repository/repository.dart';
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
import 'package:places/domain/places/place/use_case/upload_images/use_case.dart';
import 'package:places/domain/places/search/filters/filters.dart';
import 'package:places/domain/places/search/history/repository/repository.dart';
import 'package:places/domain/places/search/history/use_case/add/use_case.dart';
import 'package:places/domain/places/search/history/use_case/clear/use_case.dart';
import 'package:places/domain/places/search/history/use_case/get_history/use_case.dart';
import 'package:places/domain/places/search/history/use_case/remove/use_case.dart';
import 'package:places/domain/user_preferences/model.dart';
import 'package:places/domain/user_preferences/repository.dart';
import 'package:places/ui/app/state/favorite_places.dart';
import 'package:places/ui/app/state/observer.dart';
import 'package:places/ui/app/state/place_filters.dart';
import 'package:places/ui/app/state/place_search.dart';
import 'package:places/ui/app/state/places.dart';
import 'package:places/ui/app/state/user_preferences_state.dart';
import 'package:provider/provider.dart';

Map<Object, Create<Object>> setupUserPreferencesState({
  required UserPreferencesModel userPreferences,
  required DeviceLocationDataSource deviceLocationDataSource,
  required UserPreferencesRepository userPreferencesRepository,
}) {
  return {
    UserPreferencesState: (_) => UserPreferencesState(
          userPreferences: userPreferences,
          userPreferencesRepository: userPreferencesRepository,
          deviceLocationDataSource: deviceLocationDataSource,
        ),
  };
}

Map<Object, Create<Object>> setupPlaceFiltersState({
  required AppStateObserver appStateObserver,
  required RangeValues distanceLimit,
  required SearchFilters searchFilters,
}) {
  return {
    PlaceFiltersState: (_) => PlaceFiltersState(
          onChange: (state) {
            appStateObserver.get<UserPreferencesState>().onChangePlaceFiltersState(state);
          },
          radius: searchFilters.geoFilter.radius,
          distanceLimit: distanceLimit,
          filters: searchFilters,
        ),
  };
}

Map<Object, Create<Object>> setupPlacesStates({
  required PlaceRemoteDataSource remoteDataSource,
  required SearchHistoryRepository searchHistoryRepository,
}) {
  final placeRepository = PlaceRepositoryImpl(
    remoteDataSource: remoteDataSource,
  );

  return {
    PlacesState: (_) => PlacesState.create(
          createPlaceEntity: CreatePlaceEntity(placeRepository),
          editPlaceEntity: EditPlaceEntity(placeRepository),
          getPlaceDetails: GetPlaceDetails(placeRepository),
          getPlaces: GetPlaces(placeRepository),
          searchPlaces: SearchPlaces(placeRepository),
          uploadPlaceImages: UploadPlaceImages(placeRepository),
        ),
    PlaceSearchState: (_) => PlaceSearchState.create(
          addSearchHistory: AddSearchHistory(searchHistoryRepository),
          getSearchHistory: GetSearchHistory(searchHistoryRepository),
          clearSearchHistory: ClearSearchHistory(searchHistoryRepository),
          removeSearchHistory: RemoveSearchHistory(searchHistoryRepository),
          searchPlaces: SearchPlaces(placeRepository),
        ),
  };
}

Map<Object, Create<Object>> setupFavoritePlacesStates(
  FavoritePlaceRepository favoritePlaceRepository,
) {
  return {
    WishedPlacesState: (_) => WishedPlacesState.create(
          addPlace: AddToFavorites(favoritePlaceRepository),
          getPlaces: GetFavoritePlaces(favoritePlaceRepository),
          removePlace: RemoveFromFavorites(favoritePlaceRepository),
          reorderPlaces: ReorderFavorites(favoritePlaceRepository),
        ),
    VisitedPlacesState: (_) => VisitedPlacesState.create(
          addPlace: AddToVisited(favoritePlaceRepository),
          getPlaces: GetVisitedPlaces(favoritePlaceRepository),
          removePlace: RemoveFromVisited(favoritePlaceRepository),
          reorderPlaces: ReorderVisited(favoritePlaceRepository),
        ),
  };
}
