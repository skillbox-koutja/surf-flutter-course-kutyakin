import 'package:flutter/material.dart';
import 'package:places/ui/components/icons/splash_screen/svg_icons.dart';
import 'package:places/ui/components/main_gradient_overlay.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onReady;

  const SplashScreen({
    super.key,
    required this.onReady,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _navigateToNext();
  }

  void _navigateToNext() {
    Future<bool>.delayed(const Duration(seconds: 2), () => true).then(
      (isInitialized) {
        if (isInitialized) {
          widget.onReady();
          debugPrint('Initializing done');
        } else {
          debugPrint('Initializing failed');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: MainGradientOverlay(
        child: Center(
          child: _RotatedLogo(),
        ),
      ),
    );
  }
}

class _RotatedLogo extends StatefulWidget {
  const _RotatedLogo({Key? key}) : super(key: key);

  @override
  State<_RotatedLogo> createState() => _RotatedLogoState();
}

class _RotatedLogoState extends State<_RotatedLogo> with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> rotationAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..repeat();

    rotationAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0, end: 0.5).chain(CurveTween(curve: Curves.easeIn)),
        weight: 50.0,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0, end: 0.5).chain(CurveTween(curve: Curves.easeOut)),
        weight: 50.0,
      ),
    ]).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: rotationAnimation,
      child: const LogoSvgIcon(),
    );
  }
}
