import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/ui/components/icons/svg_icons.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorsTheme = theme.extension<CustomColors>();

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: SizedBox.fromSize(
        size: const Size.square(32),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: colorsTheme?.iconBackground,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ChevronLeftSvgIcon(
            color: colorsTheme?.icon,
          ),
        ),
      ),
    );
  }
}
