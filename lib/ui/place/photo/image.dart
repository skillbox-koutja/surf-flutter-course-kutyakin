import 'package:flutter/painting.dart';
import 'package:places/domain/places/place/photo.dart';

class PlacePhotoImage {
  final PlacePhoto photo;

  ImageProvider get image => photo.imageProvider.when(
    network: NetworkImage.new,
  );

  const PlacePhotoImage(this.photo);
}
