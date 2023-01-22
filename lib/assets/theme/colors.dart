import 'package:flutter/material.dart';

class AppColors {
  static const background = Color(0xFFF5F5F5);
  static const placeholder = Color(0xFF757575);
  static const white = Color(0xFFFFFFFF);
  static const dark = Color(0xFF1A1A20);
  static const secondary = Color(0xFF3B3E5B);
  static const secondary2 = Color(0xFF7C7E92);
  static const inactive = Color.fromRGBO(124, 126, 146, 0.56);
  static const splash = Color.fromRGBO(196, 196, 196, 0.5);
  // white
  static const whiteMain = Color(0xFF252849);
  static const whiteGreen = Color(0xFF4CAF50);
  static const whiteYellow = Color(0xFFFCDD3D);
  static const whiteRed = Color(0xFFEF4343);
  // black
  static const blackMain = Color(0xFF21222C);
  static const blackGreen = Color(0xFF6ADA6F);
  static const blackYellow = Color(0xFFFFE769);
  static const blackRed = Color(0xFFCF2A2A);
}

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  static const light = CustomColors(
    main: AppColors.whiteMain,
    green: AppColors.whiteGreen,
    yellow: AppColors.whiteYellow,
    red: AppColors.whiteRed,
    icon: AppColors.whiteMain,
    iconBackground: AppColors.white,
  );

  static const dark = CustomColors(
    main: AppColors.blackMain,
    green: AppColors.blackGreen,
    yellow: AppColors.blackYellow,
    red: AppColors.blackRed,
    icon: AppColors.white,
    iconBackground: AppColors.blackMain,
  );

  final Color? main;
  final Color? green;
  final Color? yellow;
  final Color? red;
  final Color? icon;
  final Color? iconBackground;

  const CustomColors({
    required this.main,
    required this.green,
    required this.yellow,
    required this.red,
    required this.icon,
    required this.iconBackground,
  });

  @override
  CustomColors copyWith({
    Color? main,
    Color? green,
    Color? yellow,
    Color? red,
    Color? icon,
    Color? iconBackground,
  }) {
    return CustomColors(
      main: main ?? this.main,
      green: green ?? this.green,
      yellow: yellow ?? this.yellow,
      red: red ?? this.red,
      icon: icon ?? this.icon,
      iconBackground: iconBackground ?? this.iconBackground,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }

    return CustomColors(
      main: Color.lerp(main, other.main, t),
      green: Color.lerp(green, other.green, t),
      yellow: Color.lerp(yellow, other.yellow, t),
      red: Color.lerp(red, other.red, t),
      icon: Color.lerp(icon, other.icon, t),
      iconBackground: Color.lerp(iconBackground, other.iconBackground, t),
    );
  }

  @override
  String toString() => 'CustomColors('
      'main: $main, '
      'green: $green, '
      'yellow: $yellow, '
      'red: $red, '
      'iconBackground'
      ')';
}
