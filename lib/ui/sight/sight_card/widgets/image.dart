import 'package:flutter/material.dart';
import 'package:places/domain/places/place/model.dart';
import 'package:places/ui/place/photo/image.dart';
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
        image: Ink(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            image: (place.photos.isEmpty)
                ? null
                : DecorationImage(
                    image: PlacePhotoImage(place.photo).image,
                    fit: fit,
                  ),
          ),
        ),
      ),
    );
  }
}
