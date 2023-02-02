import 'package:flutter/material.dart';

class FavoriteSightList extends StatefulWidget {
  final List<Widget> children;

  const FavoriteSightList({
    required this.children,
    Key? key,
  }) : super(key: key);

  @override
  State<FavoriteSightList> createState() => _FavoriteSightListState();
}

class _FavoriteSightListState extends State<FavoriteSightList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: widget.children,
        ),
      ),
    );
  }
}
