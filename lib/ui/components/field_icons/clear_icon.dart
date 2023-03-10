import 'package:flutter/material.dart';
import 'package:places/core/utils/extensions/build_context_ext.dart';
import 'package:places/ui/components/icons/svg_icons.dart';

class FieldClearIcon extends StatelessWidget {
  final TextEditingController controller;
  const FieldClearIcon({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsTheme = context.themeColors;

    return IconButton(
      onPressed: controller.clear,
      icon: ClearSvgIcon(color: colorsTheme.icon),
    );
  }
}
