import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/domain/sight/favorite_sight.dart';
import 'package:places/domain/sight/sight_status.dart';
import 'package:places/ui/icons/svg_icons.dart';
import 'package:places/ui/sight/sight_card/sight_card.dart';

class FavoriteSightCard extends StatelessWidget {
  final FavoriteSight favoriteSight;
  final Widget actions;

  const FavoriteSightCard({
    required this.favoriteSight,
    required this.actions,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 198, maxWidth: 328),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: SightCard(
          header: SightCardHeader(
            image: SightImage(sight: favoriteSight.sight, fit: BoxFit.fitWidth),
            typeText: SightTypeText(sight: favoriteSight.sight),
            actions: actions,
            flex: 2,
          ),
          body: SightCardBody(
            flex: 3,
            children: [
              SightNameText(sight: favoriteSight.sight),
              const SizedBox(height: 2),
              SightStatusText(
                status: favoriteSight.status,
                color: _SightStatusColors(favoriteSight).color,
              ),
              const SizedBox(height: 12),
              SightDetailsText(sight: favoriteSight.sight),
            ],
          ),
        ),
      ),
    );
  }
}

const _sightStatusColorsMap = <SightStatusType, Color>{
  SightStatusType.planned: AppColors.whiteGreen,
  SightStatusType.done: AppColors.secondary2,
};

class _SightStatusColors {
  final FavoriteSight favoriteSight;

  Color get color => _sightStatusColorsMap[favoriteSight.status.type] ?? AppColors.secondary2;

  const _SightStatusColors(this.favoriteSight);
}

class PlannedFavoriteActions extends StatelessWidget {
  final FavoriteSight favoriteSight;

  const PlannedFavoriteActions({required this.favoriteSight, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SightActions(
      children: [
        CalendarSvgIcon(
          color: AppColors.white,
        ),
        CrossSvgIcon(
          color: AppColors.white,
        ),
      ],
    );
  }
}

class DoneFavoriteActions extends StatelessWidget {
  final FavoriteSight favoriteSight;

  const DoneFavoriteActions({required this.favoriteSight, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SightActions(
      children: [
        ShareSvgIcon(
          color: AppColors.white,
        ),
        CrossSvgIcon(
          color: AppColors.white,
        ),
      ],
    );
  }
}
