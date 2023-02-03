import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/domain/sight/favorite_sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/components/empty_state.dart';
import 'package:places/ui/components/icon_action.dart';
import 'package:places/ui/icons/empty/svg_icons.dart' as empty_icons;
import 'package:places/ui/icons/svg_icons.dart';
import 'package:places/ui/sight/favorite_sights/favorite_sights_state.dart';
import 'package:places/ui/sight/favorite_sights/widgets/empty_state.dart';
import 'package:places/ui/sight/favorite_sights/widgets/favorite_sight_card.dart';
import 'package:places/ui/sight/favorite_sights/widgets/favorite_sight_list.dart';
import 'package:places/ui/sight/sight_card/widgets/actions.dart';
import 'package:provider/provider.dart';

final certainPlannedSights = sights
    .map(
      (sight) => FavoriteSight.certainPlanned(
        sight: sight,
        date: DateTime(2022, 1, 15),
      ),
    )
    .toList();

class WishedSightsWidget extends StatelessWidget {
  const WishedSightsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.read<FavoriteSightsState>();
    final list = context.select<FavoriteSightsState, FavoriteSights>((s) => s.wished);

    if (list.isEmpty) {
      return const _WishedEmptyState();
    }

    return FavoriteSightList(
      children: list
          .map(
            (favoriteSight) => FavoriteSightCard(
              favoriteSight: favoriteSight,
              actions: _PlannedFavoriteActions(
                favoriteSight: favoriteSight,
                onRemove: () {
                  state.removeWished(favoriteSight);
                },
              ),
            ),
          )
          .toList(),
    );
  }
}

class _WishedEmptyState extends StatelessWidget {
  const _WishedEmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FavoriteSightEmptyState(
      child: EmptyState(
        icon: empty_icons.CardSvgIcon(
          color: theme.disabledColor,
        ),
        title: AppMessages.favoriteSights.emptyListTitle,
        description: AppMessages.favoriteSights.emptyWishedListDescription,
      ),
    );
  }
}

class _PlannedFavoriteActions extends StatelessWidget {
  final FavoriteSight favoriteSight;
  final VoidCallback onRemove;

  const _PlannedFavoriteActions({
    required this.favoriteSight,
    required this.onRemove,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SightActions(
      children: [
        IconActionWidget(
          onPressed: () {
            print('CalendarSvgIcon: ${favoriteSight.sight.name}'); // ignore: avoid_print
          },
          icon: const CalendarSvgIcon(
            color: AppColors.white,
          ),
        ),
        IconActionWidget(
          onPressed: onRemove,
          icon: const CloseSvgIcon(
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
