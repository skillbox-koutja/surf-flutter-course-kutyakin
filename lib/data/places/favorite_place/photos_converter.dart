import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:drift/drift.dart';
import 'package:places/domain/places/place/photo.dart';

class PhotosConverter extends TypeConverter<BuiltList<PlacePhoto>, String> {
  const PhotosConverter();

  @override
  BuiltList<PlacePhoto> fromSql(String fromDb) {
    final list = json.decode(fromDb) as List<dynamic>;

    return list.map((dynamic raw) {
      final item = raw as Map<String, dynamic>;

      return PlacePhoto.fromUrl(item['url'] as String);
    }).toBuiltList();
  }

  @override
  String toSql(BuiltList<PlacePhoto> value) {
    final list = value
        .map((photo) => photo.imageProvider.when(
      network: (url) => {'provider': 'network', 'url': url},
    ))
        .toList();

    return json.encode(list);
  }
}