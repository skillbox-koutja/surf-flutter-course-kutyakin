import 'package:built_collection/built_collection.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:places/assets/theme/theme.dart';
import 'package:places/data/device_location/data_source.dart';
import 'package:places/domain/places/category/option.dart';
import 'package:places/domain/places/place/type.dart';
import 'package:places/domain/user_preferences/model.dart';
import 'package:places/domain/user_preferences/repository.dart';

part 'repository.g.dart';

class HiveUserPreferencesRepository implements UserPreferencesRepository {
  final Box<HiveUserPreferences> _box;

  const HiveUserPreferencesRepository(
    this._box,
  );

  @override
  Future<UserPreferencesModel> get(UserPreferencesModel defaultModel) async {
    var userPreferences = _box.get('model');

    if (userPreferences == null) {
      userPreferences = HiveUserPreferences.fromModel(defaultModel);

      await _box.add(userPreferences);
    }

    return UserPreferencesModel(
      themeMode: AppThemeMode.fromString(userPreferences.themeMode),
      radius: userPreferences.radius,
      selectedCategories: userPreferences.selectedCategories,
      seenOnboarding: userPreferences.seenOnboarding,
      location: defaultModel.location,
      allowedUseLocation: defaultModel.allowedUseLocation,
    );
  }

  @override
  void save(UserPreferencesModel model) {
    _box.put('model', HiveUserPreferences.fromModel(model));
  }

  static Future<HiveUserPreferencesRepository> init() async {
    final box = await Hive.openBox<HiveUserPreferences>('user_preferences');

    return HiveUserPreferencesRepository(
      box,
    );
  }
}

@HiveType(typeId: 0)
class HiveUserPreferences {
  @HiveField(0)
  final String themeMode;

  @HiveField(1)
  final double radius;

  @HiveField(2)
  final List<String> selectedPlaceTypes;

  @HiveField(3)
  final bool seenOnboarding;

  BuiltList<CategoryOption> get selectedCategories => selectedPlaceTypes
      .map(PlaceType.fromString)
      .toSet()
      .map((type) => CategoryOption.selected(type: type))
      .toBuiltList();

  const HiveUserPreferences({
    required this.themeMode,
    required this.radius,
    required this.selectedPlaceTypes,
    required this.seenOnboarding,
  });

  factory HiveUserPreferences.fromModel(UserPreferencesModel model) {
    return HiveUserPreferences(
      themeMode: model.themeMode.name,
      radius: model.radius,
      selectedPlaceTypes: model.selectedCategories.toList().map((category) => category.type.name).toList(),
      seenOnboarding: model.seenOnboarding,
    );
  }
}
