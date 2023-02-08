import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/sight/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/components/icon_action.dart';
import 'package:places/ui/components/main_gradient_overlay.dart';
import 'package:places/ui/icons/menu/svg_icons.dart';
import 'package:places/ui/icons/svg_icons.dart';
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
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
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
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: const CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: _SliverAppBar(expandedHeight: 72 + 40 + 16),
            pinned: true,
          ),
          _SearchBar(),
          _FilteredSights(),
        ],
      ),
    );
  }
}

class _SliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  const _SliverAppBar({required this.expandedHeight});

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

class _SearchBar extends StatelessWidget {
  const _SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filtersState = context.read<SightFiltersState>();

    return SliverPadding(
      padding: const EdgeInsets.all(16),
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

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          childCount: filteredSights.length * 2 - 1,
          semanticIndexCallback: (_, index) {
            return index.isEven ? index ~/ 2 : null;
          },
          (context, index) {
            final itemIndex = index ~/ 2;
            if (index.isEven) {
              return _SightCard(sight: filteredSights[itemIndex]);
            }

            const separator = SizedBox(height: 16);

            return separator;
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
