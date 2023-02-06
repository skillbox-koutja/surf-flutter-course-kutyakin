import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/ui/icons/svg_icons.dart';
import 'package:places/ui/sight/filters/filters_screen.dart';

class SearchFilterIcon extends StatelessWidget {
  final VoidCallback onClose;
  const SearchFilterIcon({
    Key? key,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorsTheme = theme.extension<CustomColors>();

    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          builder: (_) {
            return SightFiltersScreen(
              onClose: onClose,
            );
          },
        );
      },
      child: FilterSvgIcon(color: colorsTheme?.green),
    );
  }
}
