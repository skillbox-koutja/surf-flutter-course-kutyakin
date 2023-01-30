import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/ui/icons/svg_icons.dart';

class SearchClearIcon extends StatelessWidget {
  final TextEditingController controller;
  const SearchClearIcon({required this.controller, Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorsTheme = theme.extension<CustomColors>();

    return GestureDetector(
      onTap: controller.clear,
      child: ClearSvgIcon(color: colorsTheme?.icon),
    );
  }
}
