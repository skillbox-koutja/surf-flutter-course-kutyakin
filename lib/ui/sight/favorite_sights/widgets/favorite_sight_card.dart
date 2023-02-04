import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/sight/favorite_sight.dart';
import 'package:places/domain/sight/sight_status.dart';
import 'package:places/ui/icons/svg_icons.dart';
import 'package:places/ui/sight/sight_card/sight_card.dart';
import 'package:places/ui/sight/sight_card/widgets/body.dart';
import 'package:places/ui/sight/sight_card/widgets/details_text.dart';
import 'package:places/ui/sight/sight_card/widgets/header.dart';
import 'package:places/ui/sight/sight_card/widgets/image.dart';
import 'package:places/ui/sight/sight_card/widgets/name_text.dart';
import 'package:places/ui/sight/sight_card/widgets/status_text.dart';
import 'package:places/ui/sight/sight_card/widgets/type_text.dart';

class FavoriteSightCard extends StatefulWidget {
  final FavoriteSight favoriteSight;
  final Widget actions;
  final DismissDirectionCallback onDismissed;

  const FavoriteSightCard({
    required this.favoriteSight,
    required this.onDismissed,
    required this.actions,
    Key? key,
  }) : super(key: key);

  @override
  State<FavoriteSightCard> createState() => _FavoriteSightCardState();
}

class _FavoriteSightCardState extends State<FavoriteSightCard> with TickerProviderStateMixin {
  final _duration = const Duration(milliseconds: 200);
  late final AnimationController _controller = AnimationController(
    duration: _duration,
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0.4, 1.0, curve: Curves.ease),
  );
  ValueNotifier<bool> isCollapsing = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.fill(
          child: SizeTransition(
            sizeFactor: _animation,
            child: ValueListenableBuilder<bool>(
              valueListenable: isCollapsing,
              builder: (_, isCollapsing, __) {
                return _RemoveFavoriteSightBackground(
                  isCollapsing: isCollapsing,
                );
              },
            ),
          ),
        ),
        Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.endToStart,
          movementDuration: _duration,
          onDismissed: widget.onDismissed,
          onResize: () {
            if (!isCollapsing.value) {
              isCollapsing.value = true;
              _controller.forward();
            }
          },
          background: const SizedBox.shrink(),
          child: SightCard(
            header: SightCardHeader(
              image: SightImage(sight: widget.favoriteSight.sight, fit: BoxFit.fitWidth),
              typeText: SightTypeText(sight: widget.favoriteSight.sight),
              actions: widget.actions,
              flex: 2,
            ),
            body: SightCardBody(
              flex: 3,
              children: [
                SightNameText(sight: widget.favoriteSight.sight),
                const SizedBox(height: 2),
                SightStatusText(
                  status: widget.favoriteSight.status,
                  color: _SightStatusColors(widget.favoriteSight).color,
                ),
                const SizedBox(height: 12),
                SightDetailsText(sight: widget.favoriteSight.sight),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _RemoveFavoriteSightBackground extends StatelessWidget {
  final bool isCollapsing;

  const _RemoveFavoriteSightBackground({
    required this.isCollapsing,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();
    final colorsTheme = theme.extension<CustomColors>();

    return DecoratedBox(
      decoration: ShapeDecoration(
        color: colorsTheme?.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: isCollapsing
          ? const SizedBox.expand()
          : Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const BucketSvgIcon(color: AppColors.white),
                      Text(
                        AppMessages.favoriteSights.removeSightButtonLabel,
                        style: textTheme?.text?.copyWith(color: AppColors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}

const _sightStatusColorsMap = <SightStatusType, Color>{
  SightStatusType.planned: AppColors.whiteGreen,
  SightStatusType.done: AppColors.secondary2,
};

class _SightStatusColors {
  final FavoriteSight favoriteSight;

  Color get color => _sightStatusColorsMap[favoriteSight.status.type] ?? AppColors.secondary2;

  const _SightStatusColors(this.favoriteSight);
}
