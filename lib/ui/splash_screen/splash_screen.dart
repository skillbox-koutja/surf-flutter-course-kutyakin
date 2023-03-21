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
          child: LogoSvgIcon(),
        ),
      ),
    );
  }
}
