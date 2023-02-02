import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/domain/sight/favorite_sight.dart';
import 'package:places/domain/sight/sight_status.dart';
import 'package:places/ui/icons/svg_icons.dart';
import 'package:places/ui/sight/sight_card/sight_card.dart';
import 'package:places/ui/sight/sight_card/widgets/action.dart';
import 'package:places/ui/sight/sight_card/widgets/actions.dart';
import 'package:places/ui/sight/sight_card/widgets/body.dart';
import 'package:places/ui/sight/sight_card/widgets/details_text.dart';
import 'package:places/ui/sight/sight_card/widgets/header.dart';
import 'package:places/ui/sight/sight_card/widgets/image.dart';
import 'package:places/ui/sight/sight_card/widgets/name_text.dart';
import 'package:places/ui/sight/sight_card/widgets/status_text.dart';
import 'package:places/ui/sight/sight_card/widgets/type_text.dart';

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
    return Padding(
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
    return SightActions(
      children: [
        SightAction(
          onTap: () {
            print('CalendarSvgIcon: ${favoriteSight.sight.name}'); // ignore: avoid_print
          },
          child: const CalendarSvgIcon(
            color: AppColors.white,
          ),
        ),
        SightAction(
          onTap: () {
            print('CloseSvgIcon: ${favoriteSight.sight.name}'); // ignore: avoid_print
          },
          child: const CloseSvgIcon(
            color: AppColors.white,
          ),
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
    return SightActions(
      children: [
        GestureDetector(
          onTap: () {
            print('ShareSvgIcon: ${favoriteSight.sight.name}'); // ignore: avoid_print
          },
          child: const ShareSvgIcon(
            color: AppColors.white,
          ),
        ),
        GestureDetector(
          onTap: () {
            print('CloseSvgIcon: ${favoriteSight.sight.name}'); // ignore: avoid_print
          },
          child: const CloseSvgIcon(
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
