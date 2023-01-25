import 'package:flutter/material.dart';
import 'package:places/ui/sight/sight_card/widgets/body.dart';
import 'package:places/ui/sight/sight_card/widgets/header.dart';

class SightCard extends StatelessWidget {
  final SightCardHeader header;
  final SightCardBody body;

  const SightCard({
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
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        onTap: () {
          print('SightCard.onTap'); // ignore: avoid_print
        },
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
