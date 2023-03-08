import 'package:flutter/material.dart';
import 'package:places/ui/app/bottom_navigation_bar.dart';
import 'package:places/ui/settings/settings_screen.dart';
import 'package:places/ui/sight/favorite_sights/favorite_sights_screen.dart';
import 'package:places/ui/sight/sight_list/sight_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: const [
          SightListScreen(),
          Center(child: Text('MapScreen is coming soon')),
          FavoriteSightsScreen(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onTap,
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
