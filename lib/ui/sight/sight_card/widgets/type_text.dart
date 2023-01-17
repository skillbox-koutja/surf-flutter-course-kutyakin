import 'package:flutter/material.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/sight/sight.dart';

class SightTypeText extends StatelessWidget {
  final Sight sight;

  const SightTypeText({required this.sight, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      sight.type.title,
      style: const AppSmallBoldStyle(
        color: AppColors.white,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
