import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/sight/sight.dart';

class SightDetailsText extends StatelessWidget {
  final Sight sight;

  const SightDetailsText({required this.sight, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      sight.details,
      style: const AppSmallStyle(
        color: AppColors.secondary2,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
