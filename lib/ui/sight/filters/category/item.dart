import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/domain/places/category/option.dart';
import 'package:places/domain/places/place/type.dart';
import 'package:places/ui/components/icons/category/svg_icons.dart';
import 'package:places/ui/components/icons/svg_icon.dart';

class CategoryFilterItem extends StatelessWidget {
  final CategoryOption category;
  final VoidCallback? onChanged;

  const CategoryFilterItem({
    required this.category,
    required this.onChanged,
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
        onTap: onChanged,
        child: CircleAvatar(
          backgroundColor: colorsTheme?.green?.withOpacity(0.16),
          radius: 32,
          child: _Icon(type: category.type),
        ),
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  final PlaceType type;

  const _Icon({required this.type, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorsTheme = theme.extension<CustomColors>();
    final color = colorsTheme?.green;
    late SvgIcon icon;

    switch (type) {
      case PlaceType.hotel:
        icon = HotelSvgIcon(color: color);
        break;
      case PlaceType.restaurant:
        icon = RestaurantSvgIcon(color: color);
        break;
      case PlaceType.park:
        icon = ParkSvgIcon(color: color);
        break;
      case PlaceType.museum:
        icon = MuseumSvgIcon(color: color);
        break;
      case PlaceType.cafe:
        icon = CafeSvgIcon(color: color);
        break;
      case PlaceType.other:
        icon = OtherSvgIcon(color: color);
        break;
      case PlaceType.temple:
        icon = OtherSvgIcon(color: color);
        break;
      case PlaceType.monument:
        icon = OtherSvgIcon(color: color);
        break;
      case PlaceType.theatre:
        icon = OtherSvgIcon(color: color);
        break;
      case PlaceType.none:
        icon = OtherSvgIcon(color: color);
        break;
    }

    return icon;
  }
}
