import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/sight/sight.dart';
import 'package:places/ui/icons/menu/svg_icons.dart';
import 'package:places/ui/icons/svg_icons.dart';

class SightDetailsBody extends StatelessWidget {
  final Sight sight;

  const SightDetailsBody({required this.sight, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();
    final colorsTheme = theme.extension<CustomColors>();

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
          style: textTheme?.smallBold?.copyWith(
            color: AppColors.secondary2,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          sight.details,
          style: textTheme?.small,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: colorsTheme?.green,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const GoSvgIcon(
                    color: AppColors.white,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    AppMessages.sightDetails.makeRouteButtonTitle,
                    style: textTheme?.button?.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Divider(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CalendarSvgIcon(
                    color: AppColors.inactive,
                  ),
                  const SizedBox(width: 9),
                  Text(
                    AppMessages.sightDetails.planButtonTitle,
                    style: textTheme?.small?.copyWith(
                      color: AppColors.inactive,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HeartSvgIcon.filled(
                    color: theme.primaryColor,
                  ),
                  const SizedBox(width: 9),
                  Text(
                    AppMessages.sightDetails.favoriteButtonTitle,
                    style: textTheme?.small,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
