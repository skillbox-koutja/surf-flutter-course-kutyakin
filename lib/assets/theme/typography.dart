import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:places/assets/theme/colors.dart';

class AppLargeTitleStyle extends TextStyle {
  const AppLargeTitleStyle({Color? color})
      : super(
          color: color,
          fontFamily: 'Roboto',
          fontSize: 32.0,
          height: 1.12,
          fontWeight: FontWeight.w700,
        );
}

class AppTitleStyle extends TextStyle {
  const AppTitleStyle({Color? color})
      : super(
          color: color,
          fontFamily: 'Roboto',
          fontSize: 24.0,
          height: 1.2,
          fontWeight: FontWeight.w700,
        );
}

class AppSubtitleStyle extends TextStyle {
  const AppSubtitleStyle({Color? color})
      : super(
          color: color,
          fontFamily: 'Roboto',
          fontSize: 18.0,
          height: 1.33,
          fontWeight: FontWeight.w500,
        );
}

class AppTextStyle extends TextStyle {
  const AppTextStyle({Color? color})
      : super(
          color: color,
          fontFamily: 'Roboto',
          fontSize: 16.0,
          height: 1.25,
          fontWeight: FontWeight.w500,
        );
}

class AppSmallBoldStyle extends TextStyle {
  const AppSmallBoldStyle({Color? color})
      : super(
          color: color,
          fontFamily: 'Roboto',
          fontSize: 14.0,
          height: 1.29,
          fontWeight: FontWeight.w700,
        );
}

class AppSmallStyle extends TextStyle {
  const AppSmallStyle({Color? color})
      : super(
          color: color,
          fontFamily: 'Roboto',
          fontSize: 14.0,
          height: 1.29,
          fontWeight: FontWeight.w400,
        );
}

class AppSuperSmallStyle extends TextStyle {
  const AppSuperSmallStyle({Color? color})
      : super(
          color: color,
          fontFamily: 'Roboto',
          fontSize: 12.0,
          height: 1.33,
          fontWeight: FontWeight.w400,
        );
}

class AppButtonStyle extends TextStyle {
  const AppButtonStyle({Color? color})
      : super(
          color: color,
          fontFamily: 'Roboto',
          fontSize: 14.0,
          height: 1.29,
          fontWeight: FontWeight.w700,
        );
}

@immutable
class CustomTextStyles extends ThemeExtension<CustomTextStyles> {
  static const light = CustomTextStyles(
    largeTitle: AppLargeTitleStyle(
      color: AppColors.whiteMain,
    ),
    title: AppTitleStyle(
      color: AppColors.whiteMain,
    ),
    subtitle: AppSubtitleStyle(
      color: AppColors.whiteMain,
    ),
    text: AppTextStyle(
      color: AppColors.whiteMain,
    ),
    smallBold: AppSmallBoldStyle(
      color: AppColors.whiteMain,
    ),
    small: AppSmallStyle(
      color: AppColors.whiteMain,
    ),
    superSmall: AppSuperSmallStyle(
      color: AppColors.whiteMain,
    ),
    button: AppButtonStyle(
      color: AppColors.white,
    ),
  );

  static const dark = CustomTextStyles(
    largeTitle: AppLargeTitleStyle(
      color: AppColors.white,
    ),
    title: AppTitleStyle(
      color: AppColors.white,
    ),
    subtitle: AppSubtitleStyle(
      color: AppColors.white,
    ),
    text: AppTextStyle(
      color: AppColors.white,
    ),
    smallBold: AppSmallBoldStyle(
      color: AppColors.white,
    ),
    small: AppSmallStyle(
      color: AppColors.white,
    ),
    superSmall: AppSuperSmallStyle(
      color: AppColors.white,
    ),
    button: AppButtonStyle(
      color: AppColors.white,
    ),
  );

  final TextStyle? largeTitle;
  final TextStyle? title;
  final TextStyle? subtitle;
  final TextStyle? text;
  final TextStyle? smallBold;
  final TextStyle? small;
  final TextStyle? superSmall;
  final TextStyle? button;

  const CustomTextStyles({
    this.largeTitle,
    this.title,
    this.subtitle,
    this.text,
    this.smallBold,
    this.small,
    this.superSmall,
    this.button,
  });

  @override
  CustomTextStyles copyWith({
    TextStyle? largeTitle,
    TextStyle? title,
    TextStyle? subtitle,
    TextStyle? text,
    TextStyle? smallBold,
    TextStyle? small,
    TextStyle? superSmall,
    TextStyle? button,
  }) {
    return CustomTextStyles(
      largeTitle: largeTitle ?? this.largeTitle,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      text: text ?? this.text,
      smallBold: smallBold ?? this.smallBold,
      small: small ?? this.small,
      superSmall: superSmall ?? this.superSmall,
      button: button ?? this.button,
    );
  }

  @override
  CustomTextStyles lerp(ThemeExtension<CustomTextStyles>? other, double t) {
    if (other is! CustomTextStyles) {
      return this;
    }

    return CustomTextStyles(
      largeTitle: TextStyle.lerp(largeTitle, other.largeTitle, t),
      title: TextStyle.lerp(title, other.title, t),
      subtitle: TextStyle.lerp(subtitle, other.subtitle, t),
      text: TextStyle.lerp(text, other.text, t),
      smallBold: TextStyle.lerp(smallBold, other.smallBold, t),
      small: TextStyle.lerp(small, other.small, t),
      superSmall: TextStyle.lerp(superSmall, other.superSmall, t),
      button: TextStyle.lerp(button, other.button, t),
    );
  }

  @override
  String toString() => 'CustomTextStyles('
      'largeTitle: $largeTitle, '
      'title: $title, '
      'subtitle: $subtitle, '
      'text: $text, '
      'smallBold: $smallBold, '
      'small: $small, '
      'superSmall: $superSmall, '
      'button: $button, '
      ')';
}
