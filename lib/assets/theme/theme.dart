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
    padding: const EdgeInsets.all(15),
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

InputDecorationTheme buildInputDecorationTheme({
  required Color color,
  required Color fillColor,
  required Color errorColor,
}) {
  const border = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(width: 0.8, color: AppColors.inactive),
  );

  return InputDecorationTheme(
    enabledBorder: border,
    focusedBorder: border.copyWith(borderSide: BorderSide(color: color)),
    errorBorder: border.copyWith(borderSide: border.borderSide.copyWith(color: errorColor)),
    focusedErrorBorder: border.copyWith(borderSide: BorderSide(color: errorColor)),
    fillColor: fillColor,
    hintStyle: const AppTextStyle(color: AppColors.inactive).copyWith(
      overflow: TextOverflow.ellipsis,
    ),
  );
}

final lightTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    error: AppColors.whiteRed,
  ),
  primaryColor: AppColors.secondary,
  scaffoldBackgroundColor: AppColors.white,
  cardColor: AppColors.background,
  dividerColor: AppColors.inactive,
  disabledColor: AppColors.inactive,
  splashColor: AppColors.splash,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.white,
  ),
  tabBarTheme: const TabBarTheme(
    indicator: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(40)),
      color: AppColors.secondary,
    ),
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
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: AppColors.white,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.whiteMain,
  ),
  inputDecorationTheme: buildInputDecorationTheme(
    color: AppColors.whiteGreen.withOpacity(0.4),
    fillColor:  AppColors.background,
    errorColor: AppColors.whiteRed.withOpacity(0.4),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: AppColors.inactive,
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
  ),
  timePickerTheme: const TimePickerThemeData(
    backgroundColor: AppColors.timer,
    hourMinuteTextColor: AppColors.white,
    hourMinuteColor: AppColors.inactive,
    dayPeriodTextColor: AppColors.white,
    dayPeriodColor: AppColors.inactive,
    dialHandColor: AppColors.whiteGreen,
    dialBackgroundColor: AppColors.inactive,
    dialTextColor: AppColors.white,
  ),
).copyWith(
  extensions: [
    CustomColors.light,
    CustomTextStyles.light,
  ],
);

final darkTheme = ThemeData(
  colorScheme: const ColorScheme.dark(
    error: AppColors.blackRed,
  ),
  primaryColor: AppColors.white,
  scaffoldBackgroundColor: AppColors.blackMain,
  cardColor: AppColors.dark,
  dividerColor: AppColors.inactive,
  disabledColor: AppColors.inactive,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.blackMain,
  ),
  tabBarTheme: const TabBarTheme(
    indicator: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(40)),
      color: AppColors.white,
    ),
    labelStyle: AppSmallBoldStyle(
      color: AppColors.secondary,
    ),
    unselectedLabelStyle: AppSmallBoldStyle(
      color: AppColors.secondary2,
    ),
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
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: AppColors.white,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.white,
  ),
  inputDecorationTheme: buildInputDecorationTheme(
    color: AppColors.blackGreen.withOpacity(0.4),
    fillColor: AppColors.dark,
    errorColor: AppColors.blackRed.withOpacity(0.4),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: AppColors.inactive,
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
  ),
  timePickerTheme: const TimePickerThemeData(
    backgroundColor: AppColors.dark,
    hourMinuteTextColor: AppColors.white,
    hourMinuteColor: AppColors.inactive,
    dayPeriodTextColor: AppColors.white,
    dayPeriodColor: AppColors.inactive,
    dialHandColor: AppColors.whiteGreen,
    dialBackgroundColor: AppColors.inactive,
    dialTextColor: AppColors.white,
  ),
).copyWith(
  extensions: [
    CustomColors.dark,
    CustomTextStyles.dark,
  ],
);
