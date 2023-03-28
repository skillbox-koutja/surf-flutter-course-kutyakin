import 'package:flutter/material.dart';
import 'package:places/domain/places/place/model.dart';
import 'package:places/ui/place/photo/image.dart';
import 'package:places/ui/place/photo/image_widget.dart';

class PlaceImageWidget extends StatelessWidget {
  final Place place;
  final BoxFit fit;

  const PlaceImageWidget({
    required this.place,
    required this.fit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (place.photos.isEmpty) {
      return PlacePhotoImage.placeholderPhotoImage;
    }

    return PlacePhotoImageWidget(
      photo: place.photo,
      fit: fit,
    );
  }
}
