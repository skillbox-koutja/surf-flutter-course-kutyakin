import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/domain/sight/favorite_sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/components/empty_state.dart';
import 'package:places/ui/components/icon_action.dart';
import 'package:places/ui/components/icons/empty/svg_icons.dart' as empty_icons;
import 'package:places/ui/components/icons/svg_icons.dart';
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
    final sights = context.select<FavoriteSightsState, FavoriteSights>((s) => s.wished);

    if (sights.isEmpty) {
      return const _WishedEmptyState();
    }

    return FavoriteSightList(
      sights: sights,
      onRemove: state.removeWished,
      onReorder: state.reorderWished,
      buildCard: ({required favoriteSight}) {
        return FavoriteSightCard(
          favoriteSight: favoriteSight,
          actions: _PlannedFavoriteActions(
            favoriteSight: favoriteSight,
            onRemove: () {
              state.removeWished(favoriteSight);
            },
          ),
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
