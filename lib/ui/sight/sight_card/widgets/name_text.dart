import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/sight/sight.dart';

class SightNameText extends StatelessWidget {
  final Sight sight;

  const SightNameText({required this.sight, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      sight.name,
      style: const AppTextStyle(
        color: AppColors.secondary,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
