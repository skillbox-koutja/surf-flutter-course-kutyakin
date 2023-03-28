import 'package:flutter/material.dart';
import 'package:places/core/utils/extensions/build_context_ext.dart';

class MainGradientOverlay extends StatelessWidget {
  final Widget child;
  final BorderRadius? borderRadius;

  const MainGradientOverlay({
    required this.child,
    this.borderRadius,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsTheme = context.themeColors;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: LinearGradient(
          begin: const Alignment(-2.255, 0.0),
          end: const Alignment(2.3294, 0.0),
          colors: [
            colorsTheme.yellowThemeColor,
            colorsTheme.greenThemeColor,
          ],
        ),
      ),
      child: child,
    );
  }
}
