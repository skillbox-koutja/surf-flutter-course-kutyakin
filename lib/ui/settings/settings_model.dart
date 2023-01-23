import 'package:flutter/foundation.dart';

class SettingsModel extends ChangeNotifier {
  bool get isDark => _isDark;

  bool _isDark = false;

  SettingsModel({
    bool initDark = false,
  }) {
    _isDark = initDark;
  }

  void toDark() {
    _isDark = true;
    notifyListeners();
  }

  void toLight() {
    _isDark = false;
    notifyListeners();
  }

  void toggleDarkMode() {
    if (_isDark) {
      toLight();
    } else {
      toDark();
    }
  }
}
