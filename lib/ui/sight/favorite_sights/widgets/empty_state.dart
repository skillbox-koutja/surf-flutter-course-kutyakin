import 'package:flutter/material.dart';

class FavoriteSightEmptyState extends StatelessWidget {
  final Widget child;

  const FavoriteSightEmptyState({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Flexible(child: SizedBox(), flex: 3),
        Flexible(
          flex: 6,
          child: child,
        ),
        const Flexible(child: SizedBox(), flex: 3),
      ],
    );
  }
}
