import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/assets/theme/typography.dart';

ButtonStyle buildElevatedButtonStyle({
  required Color foregroundColor,
  required Color backgroundColor,
  required Color disabledBackgroundColor,
  required Color disabledForegroundColor,
}) {
  return ElevatedButton.styleFrom(
    elevation: 0,
    padding: const EdgeInsets.all(12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    textStyle: const AppButtonStyle(),
    foregroundColor: foregroundColor,
    backgroundColor: backgroundColor,
    disabledBackgroundColor: disabledBackgroundColor,
    disabledForegroundColor: disabledForegroundColor,
  );
}

ButtonStyle buildTextButtonStyle({
  required Color foregroundColor,
  required Color disabledForegroundColor,
}) {
  return TextButton.styleFrom(
    textStyle: const AppSmallStyle(),
    foregroundColor: foregroundColor,
    disabledForegroundColor: disabledForegroundColor,
  );
}

SliderThemeData buildSliderTheme() {
  return const SliderThemeData(
    overlayShape: RoundSliderOverlayShape(
      overlayRadius: 10.0,
    ),
    trackHeight: 2.0,
    trackShape: RectangularSliderTrackShape(),
    rangeTrackShape: RectangularRangeSliderTrackShape(),
  );
}

final lightTheme = ThemeData(
  colorScheme: const ColorScheme.light(),
  primaryColor: AppColors.secondary,
  scaffoldBackgroundColor: AppColors.white,
  errorColor: AppColors.whiteRed,
  cardColor: AppColors.background,
  dividerColor: AppColors.inactive,
  disabledColor: AppColors.inactive,
  splashColor: AppColors.splash,
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
  textButtonTheme: TextButtonThemeData(
    style: buildTextButtonStyle(
      foregroundColor: AppColors.secondary,
      disabledForegroundColor: AppColors.inactive,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: buildElevatedButtonStyle(
      backgroundColor: AppColors.whiteGreen,
      foregroundColor: AppColors.white,
      disabledBackgroundColor: AppColors.background,
      disabledForegroundColor: AppColors.inactive,
    ),
  ),
  sliderTheme: buildSliderTheme().copyWith(
    activeTrackColor: AppColors.whiteGreen,
    inactiveTrackColor: AppColors.inactive,
    thumbColor: AppColors.white,
    overlayColor: AppColors.background,
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
  textButtonTheme: TextButtonThemeData(
    style: buildTextButtonStyle(
      foregroundColor: AppColors.white,
      disabledForegroundColor: AppColors.inactive,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: buildElevatedButtonStyle(
      backgroundColor: AppColors.blackGreen,
      foregroundColor: AppColors.white,
      disabledBackgroundColor: AppColors.dark,
      disabledForegroundColor: AppColors.inactive,
    ),
  ),
  sliderTheme: buildSliderTheme().copyWith(
    activeTrackColor: AppColors.blackGreen,
    inactiveTrackColor: AppColors.inactive,
    thumbColor: AppColors.white,
    overlayColor: AppColors.background,
  ),
).copyWith(
  extensions: [
    CustomColors.dark,
    CustomTextStyles.dark,
  ],
);
