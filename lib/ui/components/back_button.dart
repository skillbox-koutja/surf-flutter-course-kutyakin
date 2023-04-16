import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/core/utils/extensions/build_context_ext.dart';
import 'package:places/ui/components/icons/svg_icons.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsTheme = context.themeColors;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: SizedBox.fromSize(
        size: const Size.square(32),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: colorsTheme.iconBackground,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ChevronLeftSvgIcon(
            color: colorsTheme.icon,
          ),
        ),
      ),
    );
  }
}
