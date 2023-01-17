import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/icons/svg_icons.dart';
import 'package:places/ui/sight/favorite_sights/favorite_sights_page.dart';
import 'package:places/ui/sight/sight_details/sight_details_page.dart';
import 'package:places/ui/sight/sight_list/sight_list_page.dart';

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Places',
      home: Scaffold(
        body: PageView(
          controller: pageController,
          onPageChanged: onPageChanged,
          children: [
            const SightListPage(),
            SightDetailsPage(sight: sights.last),
            const FavoriteSightsPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: ListSvgIcon(
                color: AppColors.secondary,
              ),
              activeIcon: FullListSvgIcon(
                color: AppColors.whiteMain,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: MapSvgIcon(
                color: AppColors.secondary,
              ),
              activeIcon: MapSvgIcon(
                color: AppColors.whiteRed,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: HeartSvgIcon(
                color: AppColors.secondary,
              ),
              activeIcon: FullHeartSvgIcon(
                color: AppColors.whiteMain,
              ),
              label: '',
            ),
          ],
          currentIndex: selectedIndex,
          onTap: onTap,
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
