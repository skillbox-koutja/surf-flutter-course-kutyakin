import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

part 'request.freezed.dart';

@freezed
class UploadPlaceImagesRequest with _$UploadPlaceImagesRequest {
  const factory UploadPlaceImagesRequest({
    required List<XFile> images,
  }) = _UploadPlaceImagesRequest;

  const UploadPlaceImagesRequest._();

  Future<List<MultipartFile>> multipartFiles() async {
    final list = <Future<MultipartFile>>[];

    for (final image in images) {
      final mimeType = lookupMimeType(image.path);

      list.add(MultipartFile.fromFile(
        image.path,
        contentType: MediaType.parse(mimeType ?? 'image/jpeg'),
      ));
    }

    return Future.wait(list);
  }
}
