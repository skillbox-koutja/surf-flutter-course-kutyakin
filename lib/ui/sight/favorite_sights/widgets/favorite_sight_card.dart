import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/domain/places/favorite/model.dart';
import 'package:places/domain/places/place/status.dart';
import 'package:places/ui/place/hero_image_widget.dart';
import 'package:places/ui/sight/sight_card/sight_card.dart';
import 'package:places/ui/sight/sight_card/widgets/body.dart';
import 'package:places/ui/sight/sight_card/widgets/details_text.dart';
import 'package:places/ui/sight/sight_card/widgets/header.dart';
import 'package:places/ui/sight/sight_card/widgets/image.dart';
import 'package:places/ui/sight/sight_card/widgets/name_text.dart';
import 'package:places/ui/sight/sight_card/widgets/status_text.dart';
import 'package:places/ui/sight/sight_card/widgets/type_text.dart';

class FavoriteSightCard extends StatelessWidget {
  final FavoritePlace favoritePlace;
  final Widget actions;

  const FavoriteSightCard({
    required this.favoritePlace,
    required this.actions,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final placeEntity = favoritePlace.placeEntity;
    final place = placeEntity.place;

    return SightCard(
      key: ValueKey(favoritePlace.placeEntity.id),
      placeEntity: favoritePlace.placeEntity,
      header: SightCardHeader(
        image: PlaceHeroImageWidget(
          placeEntity: placeEntity,
          child: SightImage(
            place: place,
            fit: BoxFit.fitWidth,
          ),
        ),
        typeText: SightTypeText(place: place),
        actions: actions,
        flex: 2,
      ),
      body: SightCardBody(
        flex: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SightNameText(place: place),
            const SizedBox(height: 2),
            SightStatusText(
              status: favoritePlace.status,
              color: _StatusColors(favoritePlace).color,
            ),
            const SizedBox(height: 12),
            SightDetailsText(place: place),
          ],
        ),
      ),
    );
  }
}

const _statusColorsMap = <PlaceStatusType, Color>{
  PlaceStatusType.planned: AppColors.whiteGreen,
  PlaceStatusType.done: AppColors.secondary2,
};

class _StatusColors {
  final FavoritePlace favoritePlace;

  Color get color => _statusColorsMap[favoritePlace.status.type] ?? AppColors.secondary2;

  const _StatusColors(this.favoritePlace);
}
