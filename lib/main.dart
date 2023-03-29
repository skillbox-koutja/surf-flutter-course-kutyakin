import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:places/assets/theme/theme.dart';
import 'package:places/core/dio.dart';
import 'package:places/data/places/data_source/remote.dart';
import 'package:places/data/user_preferences/repository.dart';
import 'package:places/domain/geo/filter.dart';
import 'package:places/domain/geo/geo.dart';
import 'package:places/domain/places/category/selector.dart';
import 'package:places/domain/places/search/filters/filters.dart';
import 'package:places/domain/user_preferences/model.dart';
import 'package:places/ui/app/app.dart';
import 'package:places/ui/app/state/favorite_places.dart';
import 'package:places/ui/app/state/observer.dart';
import 'package:places/ui/app/state/place_filters.dart';
import 'package:places/ui/app/state/place_search.dart';
import 'package:places/ui/app/state/places.dart';
import 'package:places/ui/app/state/user_preferences_state.dart';
import 'package:places/ui/app/state/setup.dart';
import 'package:places/ui/components/icons/splash_screen/svg_icons.dart';
import 'package:places/ui/components/icons/tutorial/svg_icons.dart';
import 'package:provider/provider.dart';

const _minDistance = 100.0;
const _radius = 5000.0;
const _maxDistance = 10000.0;
const _initialGeo = Geo(lat: 55.7522, lng: 37.6156);
const RangeValues _distanceLimit = RangeValues(_minDistance, _maxDistance);
final _remoteDataSource = PlaceRemoteDataSource(
  buildDioClient('https://test-backend-flutter.surfstudio.ru/'),
);

final _appStateObserver = AppStateObserver();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(HiveUserPreferencesAdapter());

  const loaders = [
    SvgAssetLoader(LogoSvgIcon.iconPath),
    SvgAssetLoader(TutorialFrame1SvgIcon.iconPath),
    SvgAssetLoader(TutorialFrame2SvgIcon.iconPath),
    SvgAssetLoader(TutorialFrame3SvgIcon.iconPath),
  ];

  for (final loader in loaders) {
    await svg.cache.putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
  }

  final providerFactories = await _createProviderFactories();

  ChangeNotifierProvider<T> createProvider<T extends ChangeNotifier>() {
    return ChangeNotifierProvider(create: (context) {
      final state = providerFactories[T]!(context) as T;
      _appStateObserver.add(state);

      return state;
    });
  }

  runApp(
    MultiProvider(
      providers: [
        createProvider<UserPreferencesState>(),
        createProvider<PlaceFiltersState>(),
        createProvider<PlacesState>(),
        createProvider<PlaceSearchState>(),
        createProvider<WishedPlacesState>(),
        createProvider<VisitedPlacesState>(),
      ],
      child: App(appStateObserver: _appStateObserver),
    ),
  );
}

Future<Map<Object, Create<Object>>> _createProviderFactories() async {
  final userPreferencesRepository = await HiveUserPreferencesRepository.init();

  final categorySelector = CategorySelector.fromAvailableForSelection();

  final userPreferences = await userPreferencesRepository.get(UserPreferencesModel(
    themeMode: AppThemeMode.light,
    radius: _radius,
    selectedCategories: categorySelector.selected,
    seenOnboarding: false,
  ));

  return {
    ...setupUserPreferencesState(
      userPreferencesRepository: userPreferencesRepository,
      userPreferences: userPreferences,
    ),
    ...setupPlaceFiltersState(
      userPreferencesRepository: userPreferencesRepository,
      userPreferences: userPreferences,
      distanceLimit: _distanceLimit,
      searchFilters: SearchFilters(
        geoFilter: GeoFilter(geo: _initialGeo, radius: userPreferences.radius),
        categorySelector: categorySelector.selectCategories(
          userPreferences.selectedCategories,
        ),
      ),
    ),
    ...setupPlacesStates(
      remoteDataSource: _remoteDataSource,
    ),
    ...setupFavoritePlacesStates(),
  };
}
