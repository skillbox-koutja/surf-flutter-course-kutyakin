import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:places/data/places/favorite_place/photos_converter.dart';
import 'package:places/data/places/favorite_place/table.dart';
import 'package:places/domain/places/place/photo.dart';
import 'package:places/domain/places/place/status.dart';
import 'package:places/domain/places/place/type.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    FavoritePlaceTable,
  ],
)
class AppDb extends _$AppDb {
  @override
  int get schemaVersion => 1;

  AppDb() : super(_openConnection());
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase.createInBackground(
      file,
      logStatements: true,
    );
  });
}
