import 'package:flutter/material.dart';
import 'package:places/assets/theme/theme.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/icons/svg_icons.dart';
import 'package:places/ui/sight/favorite_sights/favorite_sights_screen.dart';
import 'package:places/ui/sight/sight_details/sight_details_page.dart';
import 'package:places/ui/sight/sight_list/sight_list_screen.dart';

void main() {
  runApp(const App());
}

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
    return MaterialApp(
      title: 'Places',
      theme: isDark ? darkTheme : lightTheme,
      home: Scaffold(
        body: PageView(
          controller: pageController,
          onPageChanged: onPageChanged,
          children: [
            const SightListScreen(),
            SightDetailsPage(sight: sights.last),
            const FavoriteSightsScreen(),
          ],
        ),
        bottomNavigationBar: _BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: onTap,
          onChangeThemeTap: () {
            setState(() {
              isDark = !isDark;
            });
          },
        ),
      ),
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

class _BottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final void Function() onChangeThemeTap;

  const _BottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
    required this.onChangeThemeTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottomNavigationBarTheme = theme.bottomNavigationBarTheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: bottomNavigationBarTheme.backgroundColor,
        border: Border(
          top: BorderSide(
            color: theme.dividerColor,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 34).copyWith(top: 1),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: ListSvgIcon(
                color: bottomNavigationBarTheme.unselectedItemColor,
              ),
              activeIcon: FullListSvgIcon(
                color: bottomNavigationBarTheme.selectedItemColor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: MapSvgIcon(
                color: bottomNavigationBarTheme.unselectedItemColor,
              ),
              activeIcon: MapSvgIcon(
                color: bottomNavigationBarTheme.selectedItemColor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: HeartSvgIcon(
                color: bottomNavigationBarTheme.unselectedItemColor,
              ),
              activeIcon: FullHeartSvgIcon(
                color: bottomNavigationBarTheme.selectedItemColor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SettingsSvgIcon(
                color: bottomNavigationBarTheme.unselectedItemColor,
              ),
              label: '',
            ),
          ],
          currentIndex: currentIndex,
          onTap: (index) {
            if (index > 2) {
              return onChangeThemeTap();
            }

            onTap(index);
          },
        ),
      ),
    );
  }
}
