import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/sight/sight.dart';
import 'package:places/ui/components/icons/menu/svg_icons.dart';
import 'package:places/ui/components/icons/svg_icons.dart';

class SightDetailsBody extends StatelessWidget {
  final Sight sight;

  const SightDetailsBody({required this.sight, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sight.name,
          style: textTheme?.title,
        ),
        const SizedBox(height: 2),
        Text(
          sight.type.title,
          style: textTheme?.smallBold,
        ),
        const SizedBox(height: 24),
        Text(
          sight.details,
          style: textTheme?.small,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: const GoSvgIcon(
                color: AppColors.white,
              ),
              onPressed: () {
                print('AppMessages.sightDetails.makeRouteButtonLabel'); // ignore: avoid_print
              },
              label: Text(
                AppMessages.sightDetails.makeRouteButtonLabel,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Divider(
            height: 2,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextButton.icon(
                onPressed: null,
                icon: const CalendarSvgIcon(
                  color: AppColors.inactive,
                ),
                label: Text(
                  AppMessages.sightDetails.planButtonLabel,
                ),
              ),
            ),
            Expanded(
              child: TextButton.icon(
                onPressed: () {
                  print('AppMessages.sightDetails.favoriteButtonLabel'); // ignore: avoid_print
                },
                icon: HeartSvgIcon.filled(
                  color: theme.primaryColor,
                ),
                label: Text(
                  AppMessages.sightDetails.favoriteButtonLabel,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
