import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';

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
    final theme = Theme.of(context);
    final colorsTheme = theme.extension<CustomColors>();

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: LinearGradient(
          begin: const Alignment(-2.255, 0.0),
          end: const Alignment(2.3294, 0.0),
          colors: [
            colorsTheme?.yellow ?? Colors.yellow,
            colorsTheme?.green ?? Colors.green,
          ],
        ),
      ),
      child: child,
    );
  }
}
