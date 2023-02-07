import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/ui/onboarding/onboarding_state.dart';
import 'package:provider/provider.dart';

class TutorialFrameSlider extends StatelessWidget {
  final int framesCount;
  const TutorialFrameSlider({
    required this.framesCount,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final frame = context.select<OnboardingState, int>((s) => s.frame);

    return SizedBox(
      height: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < framesCount; i++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: _SliderIndicator(
                isActive: i == frame,
              ),
            ),
        ],
      ),
    );
  }
}

class _SliderIndicator extends StatelessWidget {
  static const double indicatorHeight = 8;
  static const indicatorRadius = Radius.circular(indicatorHeight / 2);
  final bool isActive;
  const _SliderIndicator({
    required this.isActive,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorsTheme = theme.extension<CustomColors>();

    return SizedBox(
      height: indicatorHeight,
      width: isActive ? indicatorHeight * 3 : indicatorHeight,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isActive ? colorsTheme?.green : theme.disabledColor,
          borderRadius: const BorderRadius.horizontal(
            left: indicatorRadius,
            right: indicatorRadius,
          ),
        ),
      ),
    );
  }
}
