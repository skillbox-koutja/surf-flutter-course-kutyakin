import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/assets/theme/typography.dart';

final lightTheme = ThemeData(
  colorScheme: const ColorScheme.light(),
  primaryColor: AppColors.secondary,
  scaffoldBackgroundColor: AppColors.white,
  errorColor: AppColors.whiteRed,
  cardColor: AppColors.background,
  dividerColor: AppColors.inactive,
  disabledColor: AppColors.inactive,
  tabBarTheme: const TabBarTheme(
    indicator: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(40)),
      color: AppColors.secondary,
    ),
    labelColor: AppColors.white,
    unselectedLabelColor: AppColors.secondary2,
    labelStyle: AppSmallBoldStyle(
      color: AppColors.white,
    ),
    unselectedLabelStyle: AppSmallBoldStyle(
      color: AppColors.inactive,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.white,
    selectedItemColor: AppColors.whiteMain,
    unselectedItemColor: AppColors.secondary,
  ),
  fontFamily: 'Roboto',
  buttonTheme: const ButtonThemeData(
    buttonColor: AppColors.whiteGreen,
    disabledColor: AppColors.inactive,
  ),
).copyWith(
  extensions: [
    CustomColors.light,
    CustomTextStyles.light,
  ],
);

final darkTheme = ThemeData(
  colorScheme: const ColorScheme.dark(),
  primaryColor: AppColors.white,
  scaffoldBackgroundColor: AppColors.blackMain,
  errorColor: AppColors.whiteRed,
  cardColor: AppColors.dark,
  dividerColor: AppColors.inactive,
  disabledColor: AppColors.inactive,
  tabBarTheme: const TabBarTheme(
    indicator: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(40)),
      color: AppColors.white,
    ),
    labelColor: AppColors.secondary,
    unselectedLabelColor: AppColors.secondary2,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.blackMain,
    selectedItemColor: AppColors.white,
    unselectedItemColor: AppColors.background,
  ),
  fontFamily: 'Roboto',
  buttonTheme: const ButtonThemeData(
    buttonColor: AppColors.blackGreen,
    disabledColor: AppColors.inactive,
  ),
).copyWith(
  extensions: [
    CustomColors.dark,
    CustomTextStyles.dark,
  ],
);
