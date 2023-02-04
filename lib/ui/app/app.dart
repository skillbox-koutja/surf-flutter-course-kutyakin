import 'package:flutter/material.dart';
import 'package:places/assets/theme/theme.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/app/bottom_navigation_bar.dart';
import 'package:places/ui/settings/settings_screen.dart';
import 'package:places/ui/settings/settings_state.dart';
import 'package:places/ui/sight/favorite_sights/favorite_sights_screen.dart';
import 'package:places/ui/sight/sight_details/sight_details_screen.dart';
import 'package:places/ui/sight/sight_list/sight_list_screen.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final PageController pageController = PageController();
  int selectedIndex = 0;
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsState>(
      builder: (context, settings, child) {
        return MaterialApp(
          title: 'Places',
          theme: settings.isDark ? darkTheme : lightTheme,
          builder: (context, child) {
            return _Unfocus(
              child: child!,
            );
          },
          home: Scaffold(
            body: PageView(
              controller: pageController,
              onPageChanged: onPageChanged,
              children: [
                const FavoriteSightsScreen(),
                SightDetailsScreen(sight: sights.last),
                const SightListScreen(),
                const SettingsScreen(),
              ],
            ),
            bottomNavigationBar: AppBottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: onTap,
            ),
          ),
        );
      },
    );
  }

  void onPageChanged(int page) {
    setState(() {
      selectedIndex = page;
    });
  }

  void onTap(int page) {
    pageController.jumpToPage(page);
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