import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/domain/sight/favorite_sight.dart';
import 'package:places/ui/components/empty_state.dart';
import 'package:places/ui/icons/empty/svg_icons.dart' as empty_icons;
import 'package:places/ui/icons/svg_icons.dart';
import 'package:places/ui/sight/favorite_sights/favorite_sights_state.dart';
import 'package:places/ui/sight/favorite_sights/widgets/empty_state.dart';
import 'package:places/ui/sight/favorite_sights/widgets/favorite_sight_card.dart';
import 'package:places/ui/sight/favorite_sights/widgets/favorite_sight_list.dart';
import 'package:places/ui/sight/sight_card/widgets/action.dart';
import 'package:places/ui/sight/sight_card/widgets/actions.dart';
import 'package:provider/provider.dart';

class VisitedSightsWidget extends StatelessWidget {
  const VisitedSightsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.read<FavoriteSightsState>();
    final list = context.select<FavoriteSightsState, FavoriteSights>((s) => s.visited);

    if (list.isEmpty) {
      return const _VisitedEmptyState();
    }

    return FavoriteSightList(
      children: list
          .map(
            (favoriteSight) => FavoriteSightCard(
              favoriteSight: favoriteSight,
              actions: _VisitedActions(
                favoriteSight: favoriteSight,
                onRemove: () {
                  state.removeVisited(favoriteSight);
                },
              ),
            ),
          )
          .toList(),
    );
  }
}

class _VisitedEmptyState extends StatelessWidget {
  const _VisitedEmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FavoriteSightEmptyState(
      child: EmptyState(
        icon: empty_icons.GoSvgIcon(
          color: theme.disabledColor,
        ),
        title: AppMessages.favoriteSights.emptyListTitle,
        description: AppMessages.favoriteSights.emptyVisitedListDescription,
      ),
    );
  }
}

class _VisitedActions extends StatelessWidget {
  final FavoriteSight favoriteSight;
  final VoidCallback onRemove;

  const _VisitedActions({
    required this.favoriteSight,
    required this.onRemove,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SightActions(
      children: [
        SightAction(
          onTap: () {
            print('ShareSvgIcon: ${favoriteSight.sight.name}'); // ignore: avoid_print
          },
          child: const ShareSvgIcon(
            color: AppColors.white,
          ),
        ),
        SightAction(
          onTap: onRemove,
          child: const CloseSvgIcon(
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
