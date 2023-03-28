import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';

class AppCircularProgressIndicator extends StatefulWidget {
  final Size size;
  final Color startColor;
  final Color endColor;
  final double strokeWidth;
  final Duration duration;

  const AppCircularProgressIndicator({
    required this.startColor,
    required this.endColor,
    this.size = const Size.square(32.0),
    this.strokeWidth = 6.0,
    this.duration = const Duration(seconds: 700),
    super.key,
  });

  factory AppCircularProgressIndicator.mainLoader(CustomColors themeColors) {
    return AppCircularProgressIndicator(
      startColor: themeColors.yellowThemeColor,
      endColor: themeColors.greenThemeColor,
    );
  }

  factory AppCircularProgressIndicator.defaultLoader() {
    return const AppCircularProgressIndicator(
      startColor: AppColors.secondary2,
      endColor: AppColors.background,
    );
  }

  @override
  State<AppCircularProgressIndicator> createState() => _AppCircularProgressIndicatorState();
}

const _fullCircle = math.pi * 2;

class _AppCircularProgressIndicatorState extends State<AppCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController rotationController;

  @override
  void initState() {
    super.initState();
    rotationController = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    rotationController.repeat();
  }
  @override
  void dispose() {
    rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final progressIndicatorTheme = theme.progressIndicatorTheme;

    return RotationTransition(
      turns: Tween(begin: 1.0, end: 0.0).animate(rotationController),
      child: CustomPaint(
        size: widget.size,
        painter: _CirclePaint(
          startColor: widget.startColor,
          endColor: widget.endColor,
          trackColor: progressIndicatorTheme.circularTrackColor,
          strokeWidth: widget.strokeWidth,
        ),
      ),
    );
  }
}

class _CirclePaint extends CustomPainter {
  static const startDegree = 0.0;
  static const endDegree = 320.0;

  final Color startColor;
  final Color endColor;
  final Color? trackColor;
  final double strokeWidth;

  const _CirclePaint({
    required this.startColor,
    required this.endColor,
    required this.trackColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final centerPoint = size.height / 2;
    final strokeCapSize = strokeWidth * 0.7;
    final strokeCapToDegree = strokeCapSize / centerPoint;
    final startAngle = degreeToRad(startDegree) + strokeCapToDegree;
    final sweepAngle = degreeToRad(endDegree) - (strokeCapToDegree * 2);

    final trackPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = trackColor ?? Colors.transparent;
    final paint = Paint()
      ..color = endColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..shader = SweepGradient(
        colors: [startColor, endColor],
        // stops: [0, .4],
        tileMode: TileMode.repeated,
        startAngle: degreeToRad(startDegree),
        endAngle: degreeToRad(startDegree + endDegree),
      ).createShader(
        Rect.fromCircle(
          center: Offset(centerPoint, centerPoint),
          radius: 0,
        ),
      );

    canvas
      ..drawArc(
        Offset.zero & Size(size.width, size.height),
        0,
        _fullCircle,
        false,
        trackPaint,
      )
      ..drawArc(
        Offset.zero & Size(size.width, size.height),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
  }

  @override
  bool shouldRepaint(_CirclePaint oldDelegate) {
    return true;
  }

  double degreeToRad(double degree) => degree * math.pi / 180;
}
