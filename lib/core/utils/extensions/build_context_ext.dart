import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/assets/theme/typography.dart';

extension BuildContextExt on BuildContext {
  CustomColors get themeColors => Theme.of(this).extension<CustomColors>()!;
  CustomTextStyles get themeTextStyles => Theme.of(this).extension<CustomTextStyles>()!;
}
