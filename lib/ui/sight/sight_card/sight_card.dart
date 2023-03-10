import 'package:flutter/material.dart';
import 'package:places/domain/places/place/entity.dart';
import 'package:places/ui/sight/sight_card/widgets/body.dart';
import 'package:places/ui/sight/sight_card/widgets/header.dart';
import 'package:places/ui/sight/sight_details/sight_details_bottom_sheet.dart';

class SightCard extends StatelessWidget {
  final PlaceEntity placeEntity;
  final SightCardHeader header;
  final SightCardBody body;

  const SightCard({
    required this.placeEntity,
    required this.header,
    required this.body,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: theme.cardColor,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            builder: (_) => SightDetailsBottomSheet(
              placeEntity: placeEntity,
            ),
          );
        },
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: AspectRatio(
          aspectRatio: 3 / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              header,
              body,
            ],
          ),
        ),
      ),
    );
  }
}
