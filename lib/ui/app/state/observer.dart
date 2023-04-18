import 'package:flutter/foundation.dart';
import 'package:places/data/device_location/data_source.dart';
import 'package:places/ui/app/state/favorite_places.dart';
import 'package:places/ui/app/state/place_filters.dart';
import 'package:places/ui/app/state/places.dart';
import 'package:places/ui/app/state/user_preferences_state.dart';

class AppStateObserver {
  final DeviceLocationDataSource _deviceLocationDataSource;
  final Map<Type, ChangeNotifier> _states = {};
  bool _initialized = false;

  AppStateObserver(
    this._deviceLocationDataSource,
  );

  void add(ChangeNotifier state) {
    _states.addEntries([MapEntry(state.runtimeType, state)]);
  }

  Future<void> init() async {
    debugPrint('AppStateObserver.init ($_initialized)');
    if (_initialized) return;

    final userPreferencesState = get<UserPreferencesState>();

    await userPreferencesState.init();

    get<PlaceFiltersState>()
        ..changeUserPreferences(userPreferencesState.userPreferences)
        ..addListener(_loadPlaces);

    _init();

    _initialized = true;
  }

  void dispose() {
    debugPrint('AppStateObserver.dispose');
    get<PlaceFiltersState>().removeListener(_loadPlaces);
  }

  T get<T>() {
    return _states[T] as T;
  }

  void _loadPlaces() {
    final placeFiltersState = get<PlaceFiltersState>();
    debugPrint('AppStateObserver.loadPlace');

    get<PlacesState>().loadPlaces(placeFiltersState.filters);
    get<VisitedPlacesState>().loadPlaces(placeFiltersState.filters);
    get<WishedPlacesState>().loadPlaces(placeFiltersState.filters);
  }

  void _init() {
    final placeFiltersState = get<PlaceFiltersState>();
    debugPrint('AppStateObserver._init');
    get<PlacesState>().init(placeFiltersState.filters);
    get<VisitedPlacesState>().init(placeFiltersState.filters);
    get<WishedPlacesState>().init(placeFiltersState.filters);
  }
}
