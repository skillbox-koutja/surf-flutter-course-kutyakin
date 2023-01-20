import 'package:flutter/material.dart';

class SightCardBody extends StatelessWidget {
  final List<Widget> children;
  final int flex;

  const SightCardBody({
    required this.children,
    this.flex = 1,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
