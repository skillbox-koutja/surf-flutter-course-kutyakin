import 'package:flutter/material.dart';
import 'package:places/assets/theme/theme.dart';
import 'package:places/ui/app/state/favorite_places.dart';
import 'package:places/ui/app/state/observer.dart';
import 'package:places/ui/app/state/place_filters.dart';
import 'package:places/ui/app/state/places.dart';
import 'package:places/ui/app/state/settings_state.dart';
import 'package:places/ui/home_screen/home_screen.dart';
import 'package:places/ui/onboarding/onboarding_screen.dart';
import 'package:places/ui/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> _navigator = GlobalKey<NavigatorState>();

class App extends StatefulWidget {
  final AppStateObserver appStateObserver;

  const App({
    super.key,
    required this.appStateObserver,
  });

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void dispose() {
    widget.appStateObserver.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.select<SettingsState, bool>((settings) => settings.isDark);

    return MaterialApp(
      title: 'Places',
      theme: isDark ? darkTheme : lightTheme,
      navigatorKey: _navigator,
      home: _AppStateConsumer(
        child: _Home(
          appStateObserver: widget.appStateObserver,
        ),
      ),
    );
  }
}

class _Home extends StatefulWidget {
  final AppStateObserver appStateObserver;

  const _Home({
    required this.appStateObserver,
    Key? key,
  }) : super(key: key);

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  @override
  void initState() {
    super.initState();
    widget.appStateObserver.init();
  }

  @override
  Widget build(BuildContext context) {
    void gotoHome() {
      _navigator.currentState?.pushReplacement<void, void>(
        MaterialPageRoute(
          builder: (_) {
            return const HomeScreen();
          },
        ),
      );
    }

    void gotoOnboardingScreen() {
      _navigator.currentState?.pushReplacement<void, void>(
        MaterialPageRoute(
          builder: (_) => OnboardingScreen(
            onSkip: gotoHome,
            onStart: gotoHome,
          ),
        ),
      );
    }

    return _Unfocus(
      child: SplashScreen(
        onReady: gotoOnboardingScreen,
      ),
    );
  }
}

class _Unfocus extends StatelessWidget {
  final Widget child;

  const _Unfocus({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: child,
    );
  }
}

class _AppStateConsumer extends StatelessWidget {
  final Widget child;

  const _AppStateConsumer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context
      ..read<PlaceFiltersState>()
      ..read<PlacesState>()
      ..read<VisitedPlacesState>()
      ..read<WishedPlacesState>();

    return child;
  }
}
