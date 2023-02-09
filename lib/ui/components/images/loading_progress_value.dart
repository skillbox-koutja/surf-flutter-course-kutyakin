import 'package:flutter/painting.dart';

class LoadingProgressValue {
  final double? value;

  const LoadingProgressValue({this.value});

  factory LoadingProgressValue.fromImageChunkEvent(ImageChunkEvent loadingProgress) {
    final expectedTotalBytes = loadingProgress.expectedTotalBytes;

    if (expectedTotalBytes != null && expectedTotalBytes > 0) {
      return LoadingProgressValue(value: loadingProgress.cumulativeBytesLoaded / expectedTotalBytes);
    }

    return const LoadingProgressValue();
  }
}
