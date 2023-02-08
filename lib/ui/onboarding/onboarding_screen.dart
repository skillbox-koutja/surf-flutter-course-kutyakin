import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/ui/icons/tutorial/svg_icons.dart';
import 'package:places/ui/onboarding/onboarding_state.dart';
import 'package:places/ui/onboarding/widgets/tutorial_frame_slider.dart';
import 'package:places/ui/onboarding/widgets/tutorial_frame.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  final VoidCallback onSkip;
  final VoidCallback onStart;
  const OnboardingScreen({
    required this.onSkip,
    required this.onStart,
    Key? key,
  }) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final OnboardingState onboardingState;

  @override
  void initState() {
    super.initState();

    onboardingState = OnboardingState(0);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorsTheme = theme.extension<CustomColors>();

    final tutorialFrames = [
      TutorialFrame(
        icon: TutorialFrame1SvgIcon(
          color: colorsTheme?.icon,
        ),
        title: AppMessages.onboarding.tutorialFrame1.title,
        description: AppMessages.onboarding.tutorialFrame1.description,
      ),
      TutorialFrame(
        icon: TutorialFrame2SvgIcon(
          color: colorsTheme?.icon,
        ),
        title: AppMessages.onboarding.tutorialFrame2.title,
        description: AppMessages.onboarding.tutorialFrame2.description,
      ),
      TutorialFrame(
        icon: TutorialFrame3SvgIcon(
          color: colorsTheme?.icon,
        ),
        title: AppMessages.onboarding.tutorialFrame3.title,
        description: AppMessages.onboarding.tutorialFrame3.description,
      ),
    ];

    return ChangeNotifierProvider(
      create: (_) => onboardingState,
      child: Scaffold(
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(height: 56 + MediaQuery.of(context).padding.top),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _Header(
                onSkip: widget.onSkip,
              ),
            ),
            Flexible(
              child: Stack(
                children: [
                  PageView(
                    onPageChanged: onboardingState.changeFrame,
                    children: tutorialFrames,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(flex: 6),
                      TutorialFrameSlider(framesCount: tutorialFrames.length),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: _Footer(
          onStart: widget.onStart,
          tutorialFramesCount: tutorialFrames.length,
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final VoidCallback onSkip;

  const _Header({
    required this.onSkip,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();
    final colorsTheme = theme.extension<CustomColors>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: onSkip,
            child: Text(
              AppMessages.onboarding.skipTitle,
              style: textTheme?.text?.copyWith(
                color: colorsTheme?.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  final int tutorialFramesCount;
  final VoidCallback onStart;
  const _Footer({
    required this.tutorialFramesCount,
    required this.onStart,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final frame = context.select<OnboardingState, int>((s) => s.frame);

    return SizedBox(
      height: 54,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 16.0).copyWith(bottom: 8 + MediaQuery.of(context).padding.bottom),
        child: frame < tutorialFramesCount - 1
            ? const SizedBox()
            : SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onStart,
                  child: Text(
                    AppMessages.onboarding.startButtonLabel,
                  ),
                ),
              ),
      ),
    );
  }
}
