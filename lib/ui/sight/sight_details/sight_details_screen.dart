import 'package:flutter/material.dart';
import 'package:places/domain/places/place/entity.dart';
import 'package:places/ui/components/back_button.dart';
import 'package:places/ui/sight/sight_details/widgets/sight_details.dart';

class SightDetailsScreen extends StatelessWidget {
  final PlaceEntity placeEntity;

  const SightDetailsScreen({
    super.key,
    required this.placeEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SightDetails(
        placeEntity: placeEntity,
        leading: const Center(child: AppBackButton()),
      ),
    );
  }
}
