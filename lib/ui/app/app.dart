import 'package:flutter/material.dart';
import 'package:places/assets/theme/theme.dart';
import 'package:places/ui/home_screen/home_screen.dart';
import 'package:places/ui/onboarding/onboarding_screen.dart';
import 'package:places/ui/settings/settings_state.dart';
import 'package:places/ui/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> _navigator = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsState>(
      builder: (_, settings, __) {
        return MaterialApp(
          title: 'Places',
          theme: settings.isDark ? darkTheme : lightTheme,
          navigatorKey: _navigator,
          home: const _Home(),
        );
      },
    );
  }
}

class _Home extends StatelessWidget {
  const _Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void gotoHome() {
      _navigator.currentState?.pushReplacement<void, void>(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    }
    void gotoOnboardingScreen() {
      _navigator.currentState?.pushReplacement<void, void>(
        MaterialPageRoute(
          builder: (context) => OnboardingScreen(
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