import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/ui/components/icons/svg_icons.dart';

class CloseCardButton extends StatelessWidget {
  const CloseCardButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorsTheme = theme.extension<CustomColors>();

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: SizedBox.fromSize(
        size: const Size.square(40),
        child: CircleAvatar(
          backgroundColor: colorsTheme?.iconBackground,
          child: CloseSvgIcon(
            color: colorsTheme?.icon,
          ),
        ),
      ),
    );
  }
}
