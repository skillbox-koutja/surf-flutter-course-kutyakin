import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/core/utils/extensions/build_context_ext.dart';
import 'package:places/environment/environment.dart';
import 'package:places/ui/components/add_new_place_floating_button.dart';
import 'package:places/ui/sight/search/sight_search_screen.dart';
import 'package:places/ui/sight/search/widgets/filter_icon.dart';
import 'package:places/ui/sight/search/widgets/search_bar.dart';
import 'package:places/ui/sight/sight_list/widgets/places.dart';

final _successEditedPlaceSnackBar = SnackBar(
  content: Text(AppMessages.sightsList.successEditedPlace),
);

class SightListScreen extends StatefulWidget {
  const SightListScreen({Key? key}) : super(key: key);

  @override
  State<SightListScreen> createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Body(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AddNewPlaceFloatingButton(),
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
    void onEditDone() {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(_successEditedPlaceSnackBar);
    }

    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: appBarDelegate,
            pinned: true,
          ),
          const _SearchBar(),
          PlacesContainerWidget(
            onEditDone: onEditDone,
          ),
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
    final textTheme = context.themeTextStyles;
    final collapsed = shrinkOffset / expandedHeight > 0.2;
    final screenTitle = AppMessages.sightsList.screenTitle;
    final envString = Environment.instance.buildConfig.envString;

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
                              [screenTitle, envString].where((element) => element.isNotEmpty).join(' '),
                              style: textTheme.subtitle,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16, top: 40),
                          child: Column(
                            children: [
                              Text(
                                screenTitle,
                                style: textTheme.largeTitle,
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                envString,
                                style: textTheme.subtitle,
                                textAlign: TextAlign.left,
                              ),
                            ],
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
    final textTheme = context.themeTextStyles;

    return SizedBox(
      width: double.infinity,
      child: Flexible(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
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
                  [AppMessages.sightsList.screenTitle, Environment.instance.buildConfig.envString]
                      .where((element) => element.isNotEmpty)
                      .join(' '),
                  style: textTheme.subtitle,
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
    final padding = MediaQuery.of(context).orientation == Orientation.portrait
        ? const EdgeInsets.all(16.0)
        : EdgeInsets.symmetric(horizontal: MediaQuery.of(context).padding.right).copyWith(bottom: 14);

    return SliverPadding(
      padding: padding,
      sliver: SliverToBoxAdapter(
        child: SearchBarWidget(
          suffixIcons: [
            SearchFilterIcon(
              onClose: () {
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
