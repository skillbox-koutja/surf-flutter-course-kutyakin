import 'dart:io';

import 'package:flutter/cupertino.dart';
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
import 'package:places/ui/sight/favorite_sights/widgets/empty_state.dart';
import 'package:places/ui/sight/favorite_sights/widgets/favorite_sight_card.dart';
import 'package:places/ui/sight/favorite_sights/widgets/favorite_sight_list.dart';
import 'package:places/ui/sight/sight_card/widgets/actions.dart';
import 'package:provider/provider.dart';

class WishedSightsWidget extends StatelessWidget {
  const WishedSightsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.read<WishedPlacesState>();
    final favoritePlacesData = context.select<WishedPlacesState, FavoritePlacesData>((s) => s.places);

    void onRemove(FavoritePlace favoritePlace) {
      state.remove(favoritePlace);
    }

    void onReorder({
      required int index,
      required FavoritePlace favoritePlace,
    }) {
      state.reorder(ReorderArgs(
        index: index,
        favoritePlace: favoritePlace,
      ));
    }

    if (favoritePlacesData.loading) {
      return const Center(child: CircularProgressIndicator());
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
  final VoidCallback onRemove;

  const _PlannedFavoriteActions({
    required this.onRemove,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SightActions(
      children: [
        IconActionWidget(
          onPressed: () async {
            if (Platform.isIOS) {
              final date = await _showCupertinoDatePickerModal(context);

              if (date != null) debugPrint('Selected date: $date');
            } else {
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );

              if (time != null) debugPrint('Selected time: $time');
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

Future<DateTime?> _showCupertinoDatePickerModal(BuildContext context) async {
  DateTime? date;

  await showCupertinoModalPopup<void>(
    context: context,
    builder: (context) => Container(
      height: 216,
      padding: const EdgeInsets.only(top: 6.0),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      color: CupertinoColors.systemBackground.resolveFrom(context),
      child: SafeArea(
        top: false,
        child: CupertinoDatePicker(
          initialDateTime: DateTime.now(),
          onDateTimeChanged: (value) {
            date = value;
          },
        ),
      ),
    ),
  );

  return date;
}
