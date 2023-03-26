import 'package:flutter/material.dart';
import 'package:places/domain/places/place/model.dart';
import 'package:places/ui/place/image_widget.dart';
import 'package:places/ui/sight/image_overlay/image_overlay.dart';

class SightImage extends StatelessWidget {
  final Place place;
  final BoxFit fit;

  const SightImage({
    required this.place,
    required this.fit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
      child: ImageOverlay(
        image: PlaceImageWidget(
          place: place,
          fit: fit,
        ),
      ),
    );
  }
}
