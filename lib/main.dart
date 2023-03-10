import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/core/dio.dart';
import 'package:places/data/places/data_source/remote.dart';
import 'package:places/domain/geo/filter.dart';
import 'package:places/domain/geo/geo.dart';
import 'package:places/domain/places/category/selector.dart';
import 'package:places/domain/places/search/filters/filters.dart';
import 'package:places/ui/app/app.dart';
import 'package:places/ui/app/state/favorite_places.dart';
import 'package:places/ui/app/state/observer.dart';
import 'package:places/ui/app/state/place_filters.dart';
import 'package:places/ui/app/state/place_search.dart';
import 'package:places/ui/app/state/places.dart';
import 'package:places/ui/app/state/settings_state.dart';
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

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  const loaders = [
    SvgAssetLoader(LogoSvgIcon.iconPath),
    SvgAssetLoader(TutorialFrame1SvgIcon.iconPath),
    SvgAssetLoader(TutorialFrame2SvgIcon.iconPath),
    SvgAssetLoader(TutorialFrame3SvgIcon.iconPath),
  ];

  for (final loader in loaders) {
    svg.cache.putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
  }

  final providerFactories = setupStates(
    remoteDataSource: _remoteDataSource,
    distanceLimit: _distanceLimit,
    searchFilters: SearchFilters(
      geoFilter: const GeoFilter(geo: _initialGeo, radius: _radius),
      categorySelector: CategorySelector.fromAvailableForSelection(),
    ),
  );

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
        createProvider<SettingsState>(),
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
