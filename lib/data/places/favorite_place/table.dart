import 'package:drift/drift.dart';
import 'package:places/data/places/favorite_place/photos_converter.dart';
import 'package:places/domain/places/place/status.dart';
import 'package:places/domain/places/place/type.dart';

@DataClassName('FavoritePlacePersistenceModel')
class FavoritePlaceTable extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  RealColumn get lat => real()();
  RealColumn get lng => real()();
  TextColumn get description => text()();
  TextColumn get photos => text().map(const PhotosConverter())();
  TextColumn get placeType => textEnum<PlaceType>()();
  DateTimeColumn get date => dateTime()();
  TextColumn get statusType => textEnum<PlaceStatusType>()();
  IntColumn get priority => integer()();
  @override
  Set<Column> get primaryKey => {id};
}
