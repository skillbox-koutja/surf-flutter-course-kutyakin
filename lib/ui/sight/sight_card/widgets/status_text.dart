import 'package:flutter/material.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/sight/sight_status.dart';

class SightStatusText extends StatelessWidget {
  final SightStatus status;
  final Color color;

  const SightStatusText({required this.status, required this.color, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      status.toString(),
      style: AppSmallStyle(
        color: color,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
