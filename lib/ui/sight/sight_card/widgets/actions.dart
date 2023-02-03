import 'package:flutter/material.dart';

class SightActions extends StatelessWidget {
  final List<Widget> children;

  const SightActions({required this.children, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      children: children,
    );
  }
}
