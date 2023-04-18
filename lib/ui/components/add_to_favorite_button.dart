import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/domain/places/place/entity.dart';
import 'package:places/ui/app/state/favorite_places.dart';
import 'package:places/ui/components/icon_action.dart';
import 'package:places/ui/components/icons/menu/svg_icons.dart';
import 'package:provider/provider.dart';

class AddToFavoriteButton extends StatelessWidget {
  final PlaceEntity placeEntity;

  const AddToFavoriteButton({
    required this.placeEntity,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isFavorite = context.select<WishedPlacesState, bool>((s) => s.isFavorite(placeEntity));
    final wishedPlacesState = context.read<WishedPlacesState>();

    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 250),
      firstCurve: Curves.easeIn,
      firstChild: IconActionWidget(
        onPressed: () {
          wishedPlacesState.add(placeEntity);
        },
        icon: const HeartSvgIcon(
          color: AppColors.white,
        ),
      ),
      secondCurve: Curves.easeOut,
      secondChild: IconActionWidget(
        onPressed: () {
          final favoritePlace = wishedPlacesState.findFavoritePlace(placeEntity);

          if (favoritePlace == null) return;

          wishedPlacesState.remove(favoritePlace);
        },
        icon: const HeartSvgIcon.filled(
          color: AppColors.white,
        ),
      ),
      crossFadeState: isFavorite ? CrossFadeState.showSecond : CrossFadeState.showFirst,
    );
  }
}