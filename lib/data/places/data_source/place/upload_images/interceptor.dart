import 'package:dio/dio.dart';

class UploadPlaceImagesInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 201 && response.requestOptions.path == '/upload_file' && response.data == null) {
      final baseUrl = response.requestOptions.baseUrl;
      final location = response.headers.map['location'] as List<String>;

      response.data = location.map((filePath) => '$baseUrl$filePath').toList();
    }

    super.onResponse(response, handler);
  }
}