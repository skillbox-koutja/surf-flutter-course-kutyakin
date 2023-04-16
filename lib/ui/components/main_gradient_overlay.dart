import 'package:flutter/material.dart';
import 'package:places/core/utils/extensions/build_context_ext.dart';

class MainGradientOverlay extends StatelessWidget {
  final Widget child;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;

  const MainGradientOverlay({
    required this.child,
    this.borderRadius,
    this.boxShadow,
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
        boxShadow: boxShadow,
      ),
      child: child,
    );
  }
}
