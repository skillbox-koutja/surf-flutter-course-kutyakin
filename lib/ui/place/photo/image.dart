import 'package:flutter/material.dart';
import 'package:places/domain/places/place/photo.dart';

class PlacePhotoImage {
  static const AssetImage placeholderPhotoAssetImage = AssetImage('assets/images/photo_placeholder.png');
  static final Image placeholderPhotoImage = Image.asset('assets/images/photo_placeholder.png');

  final PlacePhoto photo;

  ImageProvider get image => photo.imageProvider.when(
    network: NetworkImage.new,
  );

  const PlacePhotoImage(this.photo);
}

