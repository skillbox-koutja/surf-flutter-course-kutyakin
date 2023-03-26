import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/places/place/photo.dart';
import 'package:places/ui/place/photo/image.dart';

class PlacePhotoImageWidget extends StatelessWidget {
  final PlacePhoto photo;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const PlacePhotoImageWidget({
    required this.photo,
    required this.fit,
    this.borderRadius,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return photo.imageProvider.when(
      network: (src) => CachedNetworkImage(
        imageUrl: src,
        imageBuilder: (_, imageProvider) {
          return DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              image: DecorationImage(
                fit: fit,
                image: imageProvider, // Background image
              ),
            ),
          );
        },
        progressIndicatorBuilder: (context, url, downloadProgress) {
          return DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              image: const DecorationImage(
                image: PlacePhotoImage.placeholderPhotoAssetImage,
              ),
            ),
          );
        },
        fadeInDuration: const Duration(milliseconds: 350),
        fit: fit,
      ),
    );
  }
}
