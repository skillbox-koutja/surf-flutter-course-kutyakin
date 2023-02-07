import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/sight/sight_photo.dart';
import 'package:places/ui/icons/tutorial/svg_icons.dart';
import 'package:places/ui/images/loading_progress_value.dart';
import 'package:places/ui/sight/image_overlay/image_overlay.dart';

class TutorialFrame extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();

    return Padding(
      padding: const EdgeInsets.all(58),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(height: 40),
          Text(
            title,
            style: textTheme?.title,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: textTheme?.smallSecondary,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}