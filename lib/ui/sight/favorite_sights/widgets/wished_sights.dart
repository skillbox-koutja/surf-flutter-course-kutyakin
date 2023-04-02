import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/domain/places/favorite/model.dart';
import 'package:places/domain/places/favorite/use_case/reorder_favorites/use_case.dart';
import 'package:places/ui/app/state/favorite_places.dart';
import 'package:places/ui/app/state/favorite_places_data.dart';
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

class WishedSightsWidget extends StatelessWidget {
  const WishedSightsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wishedState = context.read<WishedPlacesState>();
    final visitedState = context.read<VisitedPlacesState>();
    final favoritePlacesData = context.select<WishedPlacesState, FavoritePlacesData>((s) => s.places);

    void onRemove(FavoritePlace favoritePlace) {
      wishedState.remove(favoritePlace);
    }

    void onAddToVisited({
      required FavoritePlace favoritePlace,
      required DateTime date,
    }) {
      wishedState.removeFromState(favoritePlace);
      visitedState.add(
        favoritePlace: favoritePlace,
        date: date,
      );
    }

    void onReorder({
      required int index,
      required int targetPriority,
      required FavoritePlace favoritePlace,
    }) {
      wishedState.reorder(
        index,
        ReorderArgs(
          targetPriority: targetPriority,
          favoritePlace: favoritePlace,
        ),
      );
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
          return const _WishedEmptyState();
        }

        return FavoriteSightList(
          favoritePlaces: favoritePlaces,
          onRemove: onRemove,
          onReorder: onReorder,
          buildCard: ({required favoritePlace}) {
            return FavoriteSightCard(
              favoritePlace: favoritePlace,
              actions: _PlannedFavoriteActions(
                favoritePlace: favoritePlace,
                onRemove: () {
                  onRemove(favoritePlace);
                },
                onAddToVisited: (date) {
                  onAddToVisited(
                    favoritePlace: favoritePlace,
                    date: date,
                  );
                },
              ),
            );
          },
        );
      },
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
  final FavoritePlace favoritePlace;
  final VoidCallback onRemove;
  final ValueChanged<DateTime> onAddToVisited;

  const _PlannedFavoriteActions({
    required this.favoritePlace,
    required this.onRemove,
    required this.onAddToVisited,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SightActions(
      children: [
        IconActionWidget(
          onPressed: () async {
            if (!Platform.isIOS) {
              final date = await _showCupertinoDatePickerModal(
                context: context,
                favoritePlace: favoritePlace,
              );

              debugPrint('(isIOS)Selected date: $date');
              if (date != null) {
                onAddToVisited(date);
              }
            } else {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: favoritePlace.status.date,
                lastDate: DateTime.now(),
              );

              debugPrint('Selected date: $date');
              if (date != null) {
                onAddToVisited(date);
              }
            }
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

Future<DateTime?> _showCupertinoDatePickerModal({
  required BuildContext context,
  required FavoritePlace favoritePlace,
}) async {
  DateTime? date = DateTime.now();

  return showCupertinoModalPopup<DateTime?>(
    context: context,
    builder: (context) => Container(
      height: 500,
      padding: const EdgeInsets.only(top: 6.0),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      color: CupertinoColors.systemBackground.resolveFrom(context),
      child: Column(
        children: [
          SizedBox(
            height: 400,
            child: CupertinoDatePicker(
              minimumDate: favoritePlace.status.date,
              initialDateTime: DateTime.now(),
              maximumDate: DateTime.now(),
              onDateTimeChanged: (value) {
                date = value;
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                child: Text(AppMessages.favoriteSights.okButtonLabel),
                onPressed: () => Navigator.of(context).pop(date),
              ),
              CupertinoButton(
                child: Text(AppMessages.favoriteSights.cancelButtonLabel),
                onPressed: () => Navigator.of(context).pop(null),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
