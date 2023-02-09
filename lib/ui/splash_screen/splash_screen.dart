import 'package:flutter/material.dart';
import 'package:places/ui/components/icons/splash_screen/svg_icons.dart';
import 'package:places/ui/components/main_gradient_overlay.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _navigateToNext();
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

  Future<void> _navigateToNext() async {
    final isInitialized = await Future<bool>.delayed(const Duration(seconds: 2), () => true);
    if (isInitialized) {
      debugPrint('Initializing done');
    } else {
      debugPrint('Initializing failed');
    }
  }
}
