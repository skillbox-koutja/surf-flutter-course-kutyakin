import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/sight/favorite_sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/sight/favorite_sights/favorite_sight_card.dart';
import 'package:places/ui/sight/favorite_sights/favorite_sight_list.dart';

class FavoriteSightsPage extends StatefulWidget {
  const FavoriteSightsPage({Key? key}) : super(key: key);

  @override
  State<FavoriteSightsPage> createState() => _FavoriteSightsPageState();
}

class _FavoriteSightsPageState extends State<FavoriteSightsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: true,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              AppMessages.favoriteSights.pageTitle,
              style: const AppSubtitleStyle(
                color: AppColors.whiteMain,
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            FavoriteSightList(
              children: sights
                  .map(
                    (sight) => FavoriteSight.certainPlanned(
                      sight: sight,
                      date: DateTime(2022, 1, 15),
                    ),
                  )
                  .map(
                    (favoriteSight) => FavoriteSightCard(
                      favoriteSight: favoriteSight,
                      actions: PlannedFavoriteActions(favoriteSight: favoriteSight),
                    ),
                  )
                  .toList(),
            ),
            FavoriteSightList(
              children: sights
                  .map(
                    (sight) => FavoriteSight.certainDone(
                      sight: sight,
                      date: DateTime(2021, 1, 12),
                    ),
                  )
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
