import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/sight/favorite_sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/sight/favorite_sights/favorite_sight_card.dart';
import 'package:places/ui/sight/favorite_sights/favorite_sight_list.dart';

final certainPlannedSights = sights
    .map(
      (sight) => FavoriteSight.certainPlanned(
        sight: sight,
        date: DateTime(2022, 1, 15),
      ),
    )
    .toList();

final certainDoneSights = sights
    .map(
      (sight) => FavoriteSight.certainDone(
        sight: sight,
        date: DateTime(2021, 1, 12),
      ),
    )
    .toList();

class FavoriteSightsScreen extends StatefulWidget {
  const FavoriteSightsScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteSightsScreen> createState() => _FavoriteSightsScreenState();
}

class _FavoriteSightsScreenState extends State<FavoriteSightsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.scaffoldBackgroundColor,
          centerTitle: true,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              AppMessages.favoriteSights.screenTitle,
              style: textTheme?.subtitle,
            ),
          ),
        ),
        body: TabBarView(
          children: [
            FavoriteSightList(
              children: certainPlannedSights
                  .map(
                    (favoriteSight) => FavoriteSightCard(
                      favoriteSight: favoriteSight,
                      actions: PlannedFavoriteActions(favoriteSight: favoriteSight),
                    ),
                  )
                  .toList(),
            ),
            FavoriteSightList(
              children: certainDoneSights
                  .map(
                    (favoriteSight) => FavoriteSightCard(
                      favoriteSight: favoriteSight,
                      actions: DoneFavoriteActions(favoriteSight: favoriteSight),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
