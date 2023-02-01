import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/app/app.dart';
import 'package:places/ui/settings/settings_state.dart';
import 'package:places/ui/sight/filters/filters_state.dart';
import 'package:provider/provider.dart';

const minDistance = 100.0;
const maxDistance = 10000.0;

const RangeValues distanceLimit = RangeValues(100.0, 10000.0);

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsState()),
        ChangeNotifierProvider(create: (_) => SightFiltersState(
          distance: distanceLimit,
          distanceLimit: distanceLimit,
          sightFilterCategories: getCategoryFilterValues(),
        )),
      ],
      child: const App(),
    ),
  );
}
