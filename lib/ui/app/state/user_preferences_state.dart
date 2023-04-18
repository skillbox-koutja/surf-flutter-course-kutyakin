import 'package:flutter/foundation.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:places/data/device_location/data_source.dart';
import 'package:places/domain/user_preferences/model.dart';
import 'package:places/domain/user_preferences/repository.dart';
import 'package:places/ui/app/state/place_filters.dart';

class UserPreferencesState extends ChangeNotifier {
  final UserPreferencesRepository _userPreferencesRepository;
  final DeviceLocationDataSource _deviceLocationDataSource;

  UserPreferencesModel userPreferences;
  List<AvailableMap> availableMaps = <AvailableMap>[];

  bool get isDark => userPreferences.isDark;
  bool get isSeenOnboarding => userPreferences.seenOnboarding;

  UserPreferencesState({
    required this.userPreferences,
    required UserPreferencesRepository userPreferencesRepository,
    required DeviceLocationDataSource deviceLocationDataSource,
  })  : _userPreferencesRepository = userPreferencesRepository,
        _deviceLocationDataSource = deviceLocationDataSource;

  Future<void> init() async {
    availableMaps = await MapLauncher.installedMaps;

    var model = await _userPreferencesRepository.get(userPreferences);

    final allowedUseLocation = await _deviceLocationDataSource.checkPermissions();
    model = allowedUseLocation ? model.allowUseLocation() : model.denyUseLocation();

    if (allowedUseLocation) {
      final currentLocation = await _deviceLocationDataSource.getCurrentLocation();

      model = currentLocation.fold(
        (l) => model.denyUseLocation(),
        (location) => model.editLocation(location),
      );
    }

    userPreferences = model;
  }

  void toggleDarkMode() {
    if (userPreferences.isDark) {
      _save(userPreferences.toLightMode());
    } else {
      _save(userPreferences.toDarkMode());
    }
  }

  void makeSeenOnboarding() {
    _save(userPreferences.makeSeenOnboarding());
  }

  void onChangePlaceFiltersState(PlaceFiltersState state) {
    final model = userPreferences
      ..selectCategories(
        state.filters.categorySelector.selected,
      )
      ..editRadius(
        state.radius,
      );

    _save(model);
  }

  void _save(UserPreferencesModel model) {
    userPreferences = model;
    _userPreferencesRepository.save(userPreferences);
    notifyListeners();
  }
}
