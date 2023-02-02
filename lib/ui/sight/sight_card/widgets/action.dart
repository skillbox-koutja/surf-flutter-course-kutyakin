import 'package:flutter/material.dart';

class SightAction extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;

  const SightAction({required this.child, required this.onTap, Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: child,
      ),
    );
  }
}
