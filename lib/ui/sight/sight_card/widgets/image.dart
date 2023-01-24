import 'package:flutter/material.dart';
import 'package:places/domain/sight/sight.dart';
import 'package:places/ui/sight/image_overlay/image_overlay.dart';

class SightImage extends StatelessWidget {
  final Sight sight;
  final BoxFit fit;

  const SightImage({
    required this.sight,
    required this.fit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
      child: ImageOverlay(
        image: Ink(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            image: DecorationImage(
              fit: fit,
              image: NetworkImage(
                sight.imageUrl,
              ), // Background image
            ),
          ),
        ),
      ),
    );
  }
}
