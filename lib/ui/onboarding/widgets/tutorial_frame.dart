import 'package:flutter/material.dart';
import 'package:places/assets/theme/typography.dart';

class TutorialFrame extends StatefulWidget {
  final Widget icon;
  final String title;
  final String description;

  const TutorialFrame({
    required this.icon,
    required this.title,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  State<TutorialFrame> createState() => _TutorialFrameState();
}

class _TutorialFrameState extends State<TutorialFrame> with TickerProviderStateMixin {

  late final AnimationController controller;
  late final Animation<double> opacity;
  late final Animation<double> dimension;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );

    opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeIn),
    );

    dimension = Tween<double>(begin: 0.0, end: 104.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeIn),
    );

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();

    return Padding(
      padding: const EdgeInsets.all(58),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return SizedBox.square(
                dimension: dimension.value,
                child: Opacity(
                  opacity: opacity.value,
                  child: widget.icon,
                ),
              );
            },
          ),
          const SizedBox(height: 40),
          Text(
            widget.title,
            style: textTheme?.title,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            widget.description,
            style: textTheme?.smallSecondary,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}