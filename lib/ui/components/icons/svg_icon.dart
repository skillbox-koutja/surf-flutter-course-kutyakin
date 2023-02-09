import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class SvgIcon extends StatelessWidget {
  final String path;
  final Color? color;

  const SvgIcon({required this.path, this.color, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      color: color,
    );
  }
}
