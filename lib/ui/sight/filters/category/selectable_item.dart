import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/ui/components/icons/svg_icons.dart';
import 'package:places/ui/sight/filters/category/item.dart';

class SelectableCategoryFilterItem extends StatelessWidget {
  final bool selected;
  final CategoryFilterItem item;

  const SelectableCategoryFilterItem({
    required this.selected,
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorsTheme = theme.extension<CustomColors>();

    return Stack(
      clipBehavior: Clip.none,
      children: [
        item,
        if (selected)
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              backgroundColor: colorsTheme?.icon,
              radius: 8,
              child: TickChoiceSvgIcon(
                color: colorsTheme?.iconBackground,
              ),
            ),
          ),
      ],
    );
  }
}
