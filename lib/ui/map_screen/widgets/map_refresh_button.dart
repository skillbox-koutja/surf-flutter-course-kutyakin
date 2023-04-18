import 'package:flutter/material.dart';
import 'package:places/core/utils/extensions/build_context_ext.dart';
import 'package:places/ui/components/icons/svg_icons.dart';
import 'package:places/ui/map_screen/widgets/map_action_button.dart';

class MapRefreshButton extends StatelessWidget {
  final VoidCallback onTap;

  const MapRefreshButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorsTheme = context.themeColors;

    return MapActionButton(
      onTap: onTap,
      icon: RefreshSvgIcon(
        color: colorsTheme.icon,
      ),
    );
  }
}
