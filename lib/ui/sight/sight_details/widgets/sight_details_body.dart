import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/sight/sight.dart';

class SightDetailsBody extends StatelessWidget {
  final Sight sight;

  const SightDetailsBody({required this.sight, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sight.name,
          style: const AppTitleStyle(
            color: AppColors.secondary,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          sight.type.title,
          style: const AppSmallBoldStyle(
            color: AppColors.secondary,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          sight.details,
          style: const AppSmallStyle(
            color: AppColors.secondary,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.whiteGreen,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: SizedBox(
              height: 48,
              child: Center(
                child: Text(
                  AppMessages.sightDetails.makeRouteButtonTitle,
                  style: const AppButtonStyle(
                    color: AppColors.white,
                  ),
                ),
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
            Expanded(child: Center(child: Text(AppMessages.sightDetails.planButtonTitle))),
            Expanded(child: Center(child: Text(AppMessages.sightDetails.favoriteButtonTitle))),
          ],
        ),
      ],
    );
  }
}
