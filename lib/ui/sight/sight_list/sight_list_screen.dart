import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/sight/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/components/icon_action.dart';
import 'package:places/ui/components/icons/menu/svg_icons.dart';
import 'package:places/ui/components/icons/svg_icons.dart';
import 'package:places/ui/components/main_gradient_overlay.dart';
import 'package:places/ui/sight/edit_sight/add_sight_screen.dart';
import 'package:places/ui/sight/filters/filters_state.dart';
import 'package:places/ui/sight/search/sight_search_screen.dart';
import 'package:places/ui/sight/search/widgets/filter_icon.dart';
import 'package:places/ui/sight/search/widgets/search_bar.dart';
import 'package:places/ui/sight/sight_card/sight_card.dart';
import 'package:places/ui/sight/sight_card/widgets/actions.dart';
import 'package:places/ui/sight/sight_card/widgets/body.dart';
import 'package:places/ui/sight/sight_card/widgets/details_text.dart';
import 'package:places/ui/sight/sight_card/widgets/header.dart';
import 'package:places/ui/sight/sight_card/widgets/image.dart';
import 'package:places/ui/sight/sight_card/widgets/name_text.dart';
import 'package:places/ui/sight/sight_card/widgets/type_text.dart';
import 'package:provider/provider.dart';

final successAddedSightSnackBar = SnackBar(
  content: Text(AppMessages.sightsList.successAddedSight),
);

class SightListScreen extends StatefulWidget {
  const SightListScreen({Key? key}) : super(key: key);

  @override
  State<SightListScreen> createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const _Body(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0,
        extendedPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        focusElevation: 0,
        hoverElevation: 0,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        enableFeedback: false,
        highlightElevation: 0,
        icon: const _FloatingButtonText(),
        label: const SizedBox(),
        onPressed: openAddSightScreen,
        // onPressed: openAddSightScreen,
      ),
    );
  }

  void openAddSightScreen() {
    Navigator.push(
      context,
      MaterialPageRoute<AddSightScreen>(
        builder: (context) {
          final filtersState = context.read<SightFiltersState>();

          return AddSightScreen(
            onSave: (sight) {
              sights.add(sight);
              filtersState.clear();
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(successAddedSightSnackBar);
            },
            onClose: () {
              Navigator.of(context).pop();
            },
          );
        },
      ),
    );
  }
}

class _Body extends StatelessWidget {
  static const appBarPaddingHeight = 56.0;
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBarDelegate = MediaQuery.of(context).orientation == Orientation.portrait
        ? const _PortraitSliverAppBar(expandedHeight: appBarPaddingHeight + 72.0)
        : const _LandscapeSliverAppBar();

    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: appBarDelegate,
            pinned: true,
          ),
          const _SearchBar(),
          const _FilteredSights(),
        ],
      ),
    );
  }
}

class _PortraitSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  const _PortraitSliverAppBar({required this.expandedHeight});

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();
    final collapsed = shrinkOffset / expandedHeight > 0.2;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Flexible(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
              ),
              child: collapsed
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              AppMessages.sightsList.screenTitle,
                              style: textTheme?.subtitle,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16, top: 40),
                          child: Text(
                            AppMessages.sightsList.screenTitle,
                            style: textTheme?.largeTitle,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LandscapeSliverAppBar extends SliverPersistentHeaderDelegate {
  @override
  double get maxExtent => kToolbarHeight;

  @override
  double get minExtent => kToolbarHeight;

  const _LandscapeSliverAppBar();

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();

    return SizedBox(
      width: double.infinity,
      child: Flexible(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            // color: Colors.red,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: MediaQuery.of(context).padding.right,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppMessages.sightsList.screenTitle,
                  style: textTheme?.subtitle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filtersState = context.read<SightFiltersState>();
    final padding = MediaQuery.of(context).orientation == Orientation.portrait
        ? const EdgeInsets.all(16.0)
        : EdgeInsets.symmetric(horizontal: MediaQuery.of(context).padding.right).copyWith(bottom: 14);

    return SliverPadding(
      padding: padding,
      sliver: SliverToBoxAdapter(
        child: SearchBar(
          suffixIcons: [
            SearchFilterIcon(
              onClose: () {
                filtersState.applyFilters();
                Navigator.of(context).pop();
              },
            ),
          ],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<SightSearchScreen>(builder: (_) => const SightSearchScreen()),
            );
          },
        ),
      ),
    );
  }
}

class _FilteredSights extends StatelessWidget {
  const _FilteredSights({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filteredSights = context.select<SightFiltersState, List<Sight>>((s) => s.filteredSights);

    return MediaQuery.of(context).orientation == Orientation.portrait
        ? _SliverListSights(
            sights: filteredSights,
          )
        : _SliverGridSights(
            sights: filteredSights,
          );
  }
}

class _SliverListSights extends StatelessWidget {
  final List<Sight> sights;

  const _SliverListSights({required this.sights, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          childCount: sights.length * 2 - 1,
          semanticIndexCallback: (_, index) {
            return index.isEven ? index ~/ 2 : null;
          },
          (context, index) {
            final itemIndex = index ~/ 2;
            if (index.isEven) {
              return _SightCard(sight: sights[itemIndex]);
            }

            const separator = SizedBox(height: 16);

            return separator;
          },
        ),
      ),
    );
  }
}

class _SliverGridSights extends StatelessWidget {
  final List<Sight> sights;

  const _SliverGridSights({required this.sights, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).padding.right),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 36.0,
          crossAxisSpacing: 36.0,
          childAspectRatio: 2,
        ),
        delegate: SliverChildBuilderDelegate(
          childCount: sights.length,
          (context, index) {
            return _SightCard(sight: sights[index]);
          },
        ),
      ),
    );
  }
}

class _FloatingButtonText extends StatelessWidget {
  const _FloatingButtonText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(left: 9),
      child: MainGradientOverlay(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 22),
          child: Row(
            children: [
              PlusSvgIcon(
                color: theme.floatingActionButtonTheme.foregroundColor,
              ),
              const SizedBox(width: 8),
              Text(
                AppMessages.sightsList.newButtonLabel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SightCard extends StatelessWidget {
  final Sight sight;

  const _SightCard({required this.sight, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SightCard(
      sight: sight,
      header: SightCardHeader(
        image: SightImage(sight: sight, fit: BoxFit.fitWidth),
        typeText: SightTypeText(sight: sight),
        actions: SightActions(
          children: [
            IconActionWidget(
              onPressed: () {
                print('HeartSvgIcon: ${sight.name}'); // ignore: avoid_print
              },
              icon: const HeartSvgIcon(
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
      body: SightCardBody(
        children: [
          SightNameText(sight: sight),
          const SizedBox(height: 2),
          SightDetailsText(sight: sight),
        ],
      ),
    );
  }
}
