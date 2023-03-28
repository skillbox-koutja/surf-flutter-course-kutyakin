import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/domain/places/favorite/model.dart';
import 'package:places/domain/places/favorite/use_case/reorder_favorites/use_case.dart';
import 'package:places/ui/app/state/favorite_places.dart';
import 'package:places/ui/components/empty_state.dart';
import 'package:places/ui/components/error_state.dart';
import 'package:places/ui/components/icon_action.dart';
import 'package:places/ui/components/icons/empty/svg_icons.dart' as empty_icons;
import 'package:places/ui/components/icons/svg_icons.dart';
import 'package:places/ui/components/progress_indicator/circular.dart';
import 'package:places/ui/sight/favorite_sights/widgets/empty_state.dart';
import 'package:places/ui/sight/favorite_sights/widgets/favorite_sight_card.dart';
import 'package:places/ui/sight/favorite_sights/widgets/favorite_sight_list.dart';
import 'package:places/ui/sight/sight_card/widgets/actions.dart';
import 'package:provider/provider.dart';

class VisitedSightsWidget extends StatelessWidget {
  const VisitedSightsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.read<VisitedPlacesState>();
    final favoritePlacesData = context.select<VisitedPlacesState, FavoritePlacesData>((s) => s.places);

    void onRemove(FavoritePlace favoritePlace) {
      state.remove(favoritePlace);
    }

    Future<void> onReorder({
      required int index,
      required FavoritePlace favoritePlace,
    }) async {
      state.reorder(ReorderArgs(
        index: index,
        favoritePlace: favoritePlace,
      ));
    }

    if (favoritePlacesData.loading) {
      return Center(child: AppCircularProgressIndicator.defaultLoader());
    }

    return favoritePlacesData.data.fold(
      (failure) {
        return const ErrorState();
      },
      (favoritePlaces) {
        if (favoritePlaces.isEmpty) {
          return const _VisitedEmptyState();
        }

        return FavoriteSightList(
          favoritePlaces: favoritePlaces,
          onRemove: onRemove,
          onReorder: onReorder,
          buildCard: ({required favoritePlace}) {
            return FavoriteSightCard(
              favoritePlace: favoritePlace,
              actions: _VisitedActions(
                onShare: () {
                  print('ShareSvgIcon: ${favoritePlace.placeEntity.place.name}'); // ignore: avoid_print
                },
                onRemove: () {
                  onRemove(favoritePlace);
                },
              ),
            );
          },
        );
      },
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
  final VoidCallback onShare;
  final VoidCallback onRemove;

  const _VisitedActions({
    required this.onShare,
    required this.onRemove,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SightActions(
      children: [
        IconActionWidget(
          onPressed: onShare,
          icon: const ShareSvgIcon(
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
