import 'package:flutter/material.dart';
import 'package:places/domain/sight/favorite_sight.dart';
import 'package:places/ui/sight/favorite_sights/favorite_sights_state.dart';
import 'package:places/ui/sight/favorite_sights/widgets/favorite_sight_card.dart';

class FavoriteSightList extends StatelessWidget {
  final FavoriteSights sights;
  final FavoriteSightCard Function({
    required FavoriteSight favoriteSight,
  }) itemBuilder;

  const FavoriteSightList({
    required this.itemBuilder,
    required this.sights,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.separated(
        separatorBuilder: (_, __) {
          return const SizedBox(height: 16);
        },
        padding: const EdgeInsets.only(bottom: 16),
        itemCount: sights.length,
        itemBuilder: (_, index) {
          final favoriteSight = sights[index];

          return itemBuilder(
            favoriteSight: favoriteSight,
          );
        },
      ),
    );
  }
}
