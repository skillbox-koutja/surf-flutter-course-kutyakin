import 'package:flutter/foundation.dart';
import 'package:places/ui/app/state/favorite_places.dart';
import 'package:places/ui/app/state/place_filters.dart';
import 'package:places/ui/app/state/places.dart';

class AppStateObserver {
  final Map<Type, ChangeNotifier> _states = {};
  bool _initialized = false;

  void add(ChangeNotifier state) {
    _states.addEntries([MapEntry(state.runtimeType, state)]);
  }

  void init() {
    debugPrint('AppStateObserver.init ($_initialized)');
    if (_initialized) return;

    get<PlaceFiltersState>().addListener(_loadPlaces);
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
