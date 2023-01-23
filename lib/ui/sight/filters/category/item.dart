import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/domain/sight/sight_type.dart';
import 'package:places/ui/icons/category/svg_icons.dart';
import 'package:places/ui/icons/svg_icon.dart';

class CategoryFilterItem extends StatelessWidget {
  final SightType type;

  const CategoryFilterItem({
    required this.type,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorsTheme = theme.extension<CustomColors>();

    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          print('_CategoryFilterItem.onTap: ${type.title}'); // ignore: avoid_print
        },
        child: CircleAvatar(
          backgroundColor: colorsTheme?.green?.withOpacity(0.16),
          radius: 32,
          child: _Icon(type: type),
        ),
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  final SightType type;

  const _Icon({required this.type, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorsTheme = theme.extension<CustomColors>();
    final color = colorsTheme?.green;
    late SvgIcon icon;

    switch (type) {
      case SightType.hotel:
        icon = HotelSvgIcon(color: color);
        break;
      case SightType.restaurant:
        icon = RestaurantSvgIcon(color: color);
        break;
      case SightType.park:
        icon = ParkSvgIcon(color: color);
        break;
      case SightType.museum:
        icon = MuseumSvgIcon(color: color);
        break;
      case SightType.cafe:
        icon = CafeSvgIcon(color: color);
        break;
      case SightType.other:
        icon = OtherSvgIcon(color: color);
        break;
    }

    return icon;
  }
}
