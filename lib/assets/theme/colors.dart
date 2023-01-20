import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AppColors {
  static const background = Color(0xFFF5F5F5);
  static const placeholder = Color(0xFF757575);
  static const white = Color(0xFFFFFFFF);
  static const dark = Color(0xFF1A1A20);
  static const secondary = Color(0xFF3B3E5B);
  static const secondary2 = Color(0xFF7C7E92);
  static const inactive = Color.fromRGBO(124, 126, 146, 0.56);
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
  );

  static const dark = CustomColors(
    main: AppColors.blackMain,
    green: AppColors.blackGreen,
    yellow: AppColors.blackYellow,
    red: AppColors.blackRed,
  );

  final Color? main;
  final Color? green;
  final Color? yellow;
  final Color? red;

  const CustomColors({
    required this.main,
    required this.green,
    required this.yellow,
    required this.red,
  });

  @override
  CustomColors copyWith({
    Color? main,
    Color? green,
    Color? yellow,
    Color? red,
  }) {
    return CustomColors(
      main: main ?? this.main,
      green: green ?? this.green,
      yellow: yellow ?? this.yellow,
      red: red ?? this.red,
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
    );
  }

  @override
  String toString() => 'CustomColors('
      'main: $main, green: $green, yellow: $yellow, red: $red'
      ')';
}
