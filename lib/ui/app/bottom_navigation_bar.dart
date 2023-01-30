import 'package:flutter/material.dart';
import 'package:places/ui/icons/menu/svg_icons.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
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
              activeIcon: ListSvgIcon.filled(
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
              activeIcon: HeartSvgIcon.filled(
                color: bottomNavigationBarTheme.selectedItemColor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SettingsSvgIcon(
                color: bottomNavigationBarTheme.unselectedItemColor,
              ),
              activeIcon: SettingsSvgIcon.filled(
                color: bottomNavigationBarTheme.unselectedItemColor,
              ),
              label: '',
            ),
          ],
          currentIndex: currentIndex,
          onTap: onTap,
        ),
      ),
    );
  }
}