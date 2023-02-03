import 'package:flutter/material.dart';

class IconActionWidget extends StatelessWidget {
  final Widget icon;
  final VoidCallback onPressed;

  const IconActionWidget({required this.icon, required this.onPressed, Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      onPressed: onPressed,
      icon: icon,
    );
  }
}
