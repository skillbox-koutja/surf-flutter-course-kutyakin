import 'package:flutter/material.dart';

class SightActions extends StatelessWidget {
  final List<Widget> children;

  const SightActions({required this.children, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3, right: 2),
      child: Wrap(
        spacing: 16,
        children: children,
      ),
    );
  }
}
