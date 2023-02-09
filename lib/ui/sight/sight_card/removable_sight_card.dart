import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/ui/components/icons/svg_icons.dart';

class RemovableSightCard extends StatefulWidget {
  final Widget card;
  final VoidCallback onRemove;

  const RemovableSightCard({
    required this.card,
    required this.onRemove,
    Key? key,
  }) : super(key: key);

  @override
  State<RemovableSightCard> createState() => _RemovableSightCardState();
}

class _RemovableSightCardState extends State<RemovableSightCard> with TickerProviderStateMixin {
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
          onDismissed: (_) {
            widget.onRemove();
          },
          onResize: () {
            if (!isCollapsing.value) {
              isCollapsing.value = true;
              _controller.forward();
            }
          },
          background: const SizedBox.shrink(),
          child: widget.card,
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
