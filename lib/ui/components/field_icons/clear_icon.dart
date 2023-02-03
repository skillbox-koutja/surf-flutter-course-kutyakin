import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/ui/icons/svg_icons.dart';

class FieldClearIcon extends StatelessWidget {
  final TextEditingController controller;
  const FieldClearIcon({required this.controller, Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorsTheme = theme.extension<CustomColors>();

    return IconButton(
      onPressed: controller.clear,
      icon: ClearSvgIcon(color: colorsTheme?.icon),
    );
  }
}
