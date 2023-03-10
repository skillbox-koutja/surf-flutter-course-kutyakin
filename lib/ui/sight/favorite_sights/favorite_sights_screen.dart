import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/ui/sight/favorite_sights/widgets/visited_sights.dart';
import 'package:places/ui/sight/favorite_sights/widgets/wished_sights.dart';

class FavoriteSightsScreen extends StatelessWidget {
  const FavoriteSightsScreen({Key? key}) : super(key: key);

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
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(52),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(40)),
                      color: Theme.of(context).cardColor,
                    ),
                    child: TabBar(
                      tabs: [
                        Tab(text: AppMessages.favoriteSights.wishListTabTitle),
                        Tab(text: AppMessages.favoriteSights.visitedTabTitle),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            WishedSightsWidget(),
            VisitedSightsWidget(),
          ],
        ),
      ),
    );
  }
}

