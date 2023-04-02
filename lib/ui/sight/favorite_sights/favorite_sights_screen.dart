import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/core/utils/extensions/build_context_ext.dart';
import 'package:places/ui/sight/favorite_sights/widgets/visited_sights.dart';
import 'package:places/ui/sight/favorite_sights/widgets/wished_sights.dart';

final List<Tab> _tabs = [
  Tab(text: AppMessages.favoriteSights.wishListTabTitle),
  Tab(text: AppMessages.favoriteSights.visitedTabTitle),
];
const _tabsHeight = 40.0;

class FavoriteSightsScreen extends StatefulWidget {
  const FavoriteSightsScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteSightsScreen> createState() => _FavoriteSightsScreenState();
}

class _FavoriteSightsScreenState extends State<FavoriteSightsScreen> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      vsync: this,
      length: 2,
      animationDuration: const Duration(
        milliseconds: 350,
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = context.themeTextStyles;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        centerTitle: true,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            AppMessages.favoriteSights.screenTitle,
            style: textTheme.subtitle,
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
                  child: _TabBar(
                    // splashFactory: NoSplash.splashFactory,
                    tabController: tabController,
                    tabs: _tabs,
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          WishedSightsWidget(),
          VisitedSightsWidget(),
        ],
      ),
    );
  }
}

class _TabBar extends StatefulWidget {
  final TabController tabController;
  final List<Widget> tabs;

  const _TabBar({
    super.key,
    required this.tabs,
    required this.tabController,
  });

  @override
  State<_TabBar> createState() => _TabBarState();
}

class _TabBarState extends State<_TabBar> with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  final ValueNotifier<int> index = ValueNotifier<int>(0);
  late final Animation<double> opacity;

  void runOpacityAnimation() {
    index.value = widget.tabController.index;
    animationController.forward();
  }

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: const Duration(milliseconds: 1),
      vsync: this,
    );

    opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.linear),
    );

    widget.tabController.addListener(runOpacityAnimation);

    animationController.forward();
  }

  @override
  void dispose() {
    widget.tabController.removeListener(runOpacityAnimation);
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appBarTheme = Theme.of(context).appBarTheme;
    final tabBarTheme = Theme.of(context).tabBarTheme;
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        animationController.reverse().whenComplete(() {
          final tabIndex = index.value == 0 ? 1 : 0;
          widget.tabController.index = tabIndex;
        });
      },
      child: SizedBox(
        height: _tabsHeight,
        width: width,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_tabsHeight),
            color: appBarTheme.foregroundColor,
          ),
          child: Stack(
            children: [
              ValueListenableBuilder(
                valueListenable: index,
                builder: (_, index, __) {
                  return Align(
                    alignment: index == 0 ? Alignment.centerRight : Alignment.centerLeft,
                    child: AnimatedBuilder(
                      animation: animationController,
                      builder: (context, child) {
                        return Opacity(
                          opacity: opacity.value,
                          child: SizedBox(
                            height: _tabsHeight,
                            width: width / 2,
                            child: Center(
                              child: Text(
                                _tabs[index == 0 ? 1 : 0].text!,
                                style: tabBarTheme.unselectedLabelStyle,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              ValueListenableBuilder(
                valueListenable: index,
                builder: (_, index, __) {
                  return AnimatedAlign(
                    duration: widget.tabController.animationDuration,
                    alignment: index == 1 ? Alignment.centerRight : Alignment.centerLeft,
                    child: DecoratedBox(
                      decoration: tabBarTheme.indicator!,
                      child: SizedBox(
                        height: _tabsHeight,
                        width: width / 2,
                        child: Center(
                          child: Text(
                            _tabs[index].text!,
                            style: tabBarTheme.labelStyle,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
