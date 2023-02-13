import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/app/app.dart';
import 'package:places/ui/components/icons/splash_screen/svg_icons.dart';
import 'package:places/ui/components/icons/tutorial/svg_icons.dart';
import 'package:places/ui/onboarding/onboarding_screen.dart';
import 'package:places/ui/settings/settings_state.dart';
import 'package:places/ui/sight/filters/filters_state.dart';
import 'package:places/ui/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

const minDistance = 100.0;
const maxDistance = 10000.0;

const RangeValues distanceLimit = RangeValues(100.0, 10000.0);

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

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsState()),
        ChangeNotifierProvider(
          create: (_) => SightFiltersState(
            distance: distanceLimit,
            distanceLimit: distanceLimit,
            sightFilterCategories: getCategoryFilterValues(),
          ),
        ),
      ],
      child: const App(),
    ),
  );
}
