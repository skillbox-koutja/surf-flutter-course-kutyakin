import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';

class PlacePhoto {
  final PlacePhotoProvider imageProvider;

  PlacePhoto({
    required this.imageProvider,
  });

  factory PlacePhoto.fromUrl(String url) {
    return PlacePhoto(
      imageProvider: PlacePhotoProvider.network(url),
    );
  }
}

@freezed
class PlacePhotoProvider with _$PlacePhotoProvider {
  const factory PlacePhotoProvider.network(String url) = PlacePhotoNetworkImage;
}

