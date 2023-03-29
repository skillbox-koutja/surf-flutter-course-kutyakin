import 'package:flutter/foundation.dart';
import 'package:places/domain/user_preferences/model.dart';
import 'package:places/domain/user_preferences/repository.dart';

class UserPreferencesState extends ChangeNotifier {
  UserPreferencesModel userPreferences;
  UserPreferencesRepository userPreferencesRepository;

  bool get isDark => userPreferences.isDark;
  bool get isSeenOnboarding => userPreferences.seenOnboarding;

  UserPreferencesState({
    required this.userPreferences,
    required this.userPreferencesRepository,
  });

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

  void _save(UserPreferencesModel model) {
    userPreferences = model;
    userPreferencesRepository.save(userPreferences);
    notifyListeners();
  }
}
