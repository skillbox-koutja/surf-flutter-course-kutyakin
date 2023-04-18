import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/core/utils/extensions/build_context_ext.dart';
import 'package:places/ui/components/icons/svg_icons.dart';

class MapActionButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onTap;

  const MapActionButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorsTheme = context.themeColors;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox.fromSize(
        size: const Size.square(48),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: colorsTheme.mapItemBackground,
            borderRadius: BorderRadius.circular(56.0),
            boxShadow: const [
              BoxShadow(
                color: AppColors.mapBoxShadow,
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: icon,
          ),
        ),
      ),
    );
  }
}
