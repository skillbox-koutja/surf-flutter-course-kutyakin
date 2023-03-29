import 'package:flutter/material.dart';
import 'package:places/ui/sight/sight_card/widgets/image.dart';
import 'package:places/ui/sight/sight_card/widgets/type_text.dart';

class SightCardHeader extends StatelessWidget {
  final Widget image;
  final SightTypeText typeText;
  final Widget actions;
  final int flex;

  const SightCardHeader({
    required this.image,
    required this.typeText,
    required this.actions,
    this.flex = 1,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      child: Stack(
        children: [
          image,
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                typeText,
                actions,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
