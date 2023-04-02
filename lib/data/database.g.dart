// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $FavoritePlaceTableTable extends FavoritePlaceTable
    with TableInfo<$FavoritePlaceTableTable, FavoritePlacePersistenceModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoritePlaceTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
      'lat', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _lngMeta = const VerificationMeta('lng');
  @override
  late final GeneratedColumn<double> lng = GeneratedColumn<double>(
      'lng', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _photosMeta = const VerificationMeta('photos');
  @override
  late final GeneratedColumnWithTypeConverter<BuiltList<PlacePhoto>, String>
      photos = GeneratedColumn<String>('photos', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<BuiltList<PlacePhoto>>(
              $FavoritePlaceTableTable.$converterphotos);
  static const VerificationMeta _placeTypeMeta =
      const VerificationMeta('placeType');
  @override
  late final GeneratedColumnWithTypeConverter<PlaceType, String> placeType =
      GeneratedColumn<String>('place_type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<PlaceType>(
              $FavoritePlaceTableTable.$converterplaceType);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _statusTypeMeta =
      const VerificationMeta('statusType');
  @override
  late final GeneratedColumnWithTypeConverter<PlaceStatusType, String>
      statusType = GeneratedColumn<String>('status_type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<PlaceStatusType>(
              $FavoritePlaceTableTable.$converterstatusType);
  static const VerificationMeta _priorityMeta =
      const VerificationMeta('priority');
  @override
  late final GeneratedColumn<int> priority = GeneratedColumn<int>(
      'priority', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        lat,
        lng,
        description,
        photos,
        placeType,
        date,
        statusType,
        priority
      ];
  @override
  String get aliasedName => _alias ?? 'favorite_place_table';
  @override
  String get actualTableName => 'favorite_place_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<FavoritePlacePersistenceModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('lat')) {
      context.handle(
          _latMeta, lat.isAcceptableOrUnknown(data['lat']!, _latMeta));
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('lng')) {
      context.handle(
          _lngMeta, lng.isAcceptableOrUnknown(data['lng']!, _lngMeta));
    } else if (isInserting) {
      context.missing(_lngMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    context.handle(_photosMeta, const VerificationResult.success());
    context.handle(_placeTypeMeta, const VerificationResult.success());
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    context.handle(_statusTypeMeta, const VerificationResult.success());
    if (data.containsKey('priority')) {
      context.handle(_priorityMeta,
          priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta));
    } else if (isInserting) {
      context.missing(_priorityMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoritePlacePersistenceModel map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoritePlacePersistenceModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      lat: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}lat'])!,
      lng: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}lng'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      photos: $FavoritePlaceTableTable.$converterphotos.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}photos'])!),
      placeType: $FavoritePlaceTableTable.$converterplaceType.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}place_type'])!),
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      statusType: $FavoritePlaceTableTable.$converterstatusType.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}status_type'])!),
      priority: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}priority'])!,
    );
  }

  @override
  $FavoritePlaceTableTable createAlias(String alias) {
    return $FavoritePlaceTableTable(attachedDatabase, alias);
  }

  static TypeConverter<BuiltList<PlacePhoto>, String> $converterphotos =
      const PhotosConverter();
  static JsonTypeConverter2<PlaceType, String, String> $converterplaceType =
      const EnumNameConverter<PlaceType>(PlaceType.values);
  static JsonTypeConverter2<PlaceStatusType, String, String>
      $converterstatusType =
      const EnumNameConverter<PlaceStatusType>(PlaceStatusType.values);
}

class FavoritePlacePersistenceModel extends DataClass
    implements Insertable<FavoritePlacePersistenceModel> {
  final int id;
  final String name;
  final double lat;
  final double lng;
  final String description;
  final BuiltList<PlacePhoto> photos;
  final PlaceType placeType;
  final DateTime date;
  final PlaceStatusType statusType;
  final int priority;
  const FavoritePlacePersistenceModel(
      {required this.id,
      required this.name,
      required this.lat,
      required this.lng,
      required this.description,
      required this.photos,
      required this.placeType,
      required this.date,
      required this.statusType,
      required this.priority});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['lat'] = Variable<double>(lat);
    map['lng'] = Variable<double>(lng);
    map['description'] = Variable<String>(description);
    {
      final converter = $FavoritePlaceTableTable.$converterphotos;
      map['photos'] = Variable<String>(converter.toSql(photos));
    }
    {
      final converter = $FavoritePlaceTableTable.$converterplaceType;
      map['place_type'] = Variable<String>(converter.toSql(placeType));
    }
    map['date'] = Variable<DateTime>(date);
    {
      final converter = $FavoritePlaceTableTable.$converterstatusType;
      map['status_type'] = Variable<String>(converter.toSql(statusType));
    }
    map['priority'] = Variable<int>(priority);
    return map;
  }

  FavoritePlaceTableCompanion toCompanion(bool nullToAbsent) {
    return FavoritePlaceTableCompanion(
      id: Value(id),
      name: Value(name),
      lat: Value(lat),
      lng: Value(lng),
      description: Value(description),
      photos: Value(photos),
      placeType: Value(placeType),
      date: Value(date),
      statusType: Value(statusType),
      priority: Value(priority),
    );
  }

  factory FavoritePlacePersistenceModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoritePlacePersistenceModel(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      lat: serializer.fromJson<double>(json['lat']),
      lng: serializer.fromJson<double>(json['lng']),
      description: serializer.fromJson<String>(json['description']),
      photos: serializer.fromJson<BuiltList<PlacePhoto>>(json['photos']),
      placeType: $FavoritePlaceTableTable.$converterplaceType
          .fromJson(serializer.fromJson<String>(json['placeType'])),
      date: serializer.fromJson<DateTime>(json['date']),
      statusType: $FavoritePlaceTableTable.$converterstatusType
          .fromJson(serializer.fromJson<String>(json['statusType'])),
      priority: serializer.fromJson<int>(json['priority']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'lat': serializer.toJson<double>(lat),
      'lng': serializer.toJson<double>(lng),
      'description': serializer.toJson<String>(description),
      'photos': serializer.toJson<BuiltList<PlacePhoto>>(photos),
      'placeType': serializer.toJson<String>(
          $FavoritePlaceTableTable.$converterplaceType.toJson(placeType)),
      'date': serializer.toJson<DateTime>(date),
      'statusType': serializer.toJson<String>(
          $FavoritePlaceTableTable.$converterstatusType.toJson(statusType)),
      'priority': serializer.toJson<int>(priority),
    };
  }

  FavoritePlacePersistenceModel copyWith(
          {int? id,
          String? name,
          double? lat,
          double? lng,
          String? description,
          BuiltList<PlacePhoto>? photos,
          PlaceType? placeType,
          DateTime? date,
          PlaceStatusType? statusType,
          int? priority}) =>
      FavoritePlacePersistenceModel(
        id: id ?? this.id,
        name: name ?? this.name,
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
        description: description ?? this.description,
        photos: photos ?? this.photos,
        placeType: placeType ?? this.placeType,
        date: date ?? this.date,
        statusType: statusType ?? this.statusType,
        priority: priority ?? this.priority,
      );
  @override
  String toString() {
    return (StringBuffer('FavoritePlacePersistenceModel(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('description: $description, ')
          ..write('photos: $photos, ')
          ..write('placeType: $placeType, ')
          ..write('date: $date, ')
          ..write('statusType: $statusType, ')
          ..write('priority: $priority')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, lat, lng, description, photos,
      placeType, date, statusType, priority);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoritePlacePersistenceModel &&
          other.id == this.id &&
          other.name == this.name &&
          other.lat == this.lat &&
          other.lng == this.lng &&
          other.description == this.description &&
          other.photos == this.photos &&
          other.placeType == this.placeType &&
          other.date == this.date &&
          other.statusType == this.statusType &&
          other.priority == this.priority);
}

class FavoritePlaceTableCompanion
    extends UpdateCompanion<FavoritePlacePersistenceModel> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> lat;
  final Value<double> lng;
  final Value<String> description;
  final Value<BuiltList<PlacePhoto>> photos;
  final Value<PlaceType> placeType;
  final Value<DateTime> date;
  final Value<PlaceStatusType> statusType;
  final Value<int> priority;
  const FavoritePlaceTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    this.description = const Value.absent(),
    this.photos = const Value.absent(),
    this.placeType = const Value.absent(),
    this.date = const Value.absent(),
    this.statusType = const Value.absent(),
    this.priority = const Value.absent(),
  });
  FavoritePlaceTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required double lat,
    required double lng,
    required String description,
    required BuiltList<PlacePhoto> photos,
    required PlaceType placeType,
    required DateTime date,
    required PlaceStatusType statusType,
    required int priority,
  })  : name = Value(name),
        lat = Value(lat),
        lng = Value(lng),
        description = Value(description),
        photos = Value(photos),
        placeType = Value(placeType),
        date = Value(date),
        statusType = Value(statusType),
        priority = Value(priority);
  static Insertable<FavoritePlacePersistenceModel> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? lat,
    Expression<double>? lng,
    Expression<String>? description,
    Expression<String>? photos,
    Expression<String>? placeType,
    Expression<DateTime>? date,
    Expression<String>? statusType,
    Expression<int>? priority,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
      if (description != null) 'description': description,
      if (photos != null) 'photos': photos,
      if (placeType != null) 'place_type': placeType,
      if (date != null) 'date': date,
      if (statusType != null) 'status_type': statusType,
      if (priority != null) 'priority': priority,
    });
  }

  FavoritePlaceTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<double>? lat,
      Value<double>? lng,
      Value<String>? description,
      Value<BuiltList<PlacePhoto>>? photos,
      Value<PlaceType>? placeType,
      Value<DateTime>? date,
      Value<PlaceStatusType>? statusType,
      Value<int>? priority}) {
    return FavoritePlaceTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      description: description ?? this.description,
      photos: photos ?? this.photos,
      placeType: placeType ?? this.placeType,
      date: date ?? this.date,
      statusType: statusType ?? this.statusType,
      priority: priority ?? this.priority,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lng.present) {
      map['lng'] = Variable<double>(lng.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (photos.present) {
      final converter = $FavoritePlaceTableTable.$converterphotos;
      map['photos'] = Variable<String>(converter.toSql(photos.value));
    }
    if (placeType.present) {
      final converter = $FavoritePlaceTableTable.$converterplaceType;
      map['place_type'] = Variable<String>(converter.toSql(placeType.value));
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (statusType.present) {
      final converter = $FavoritePlaceTableTable.$converterstatusType;
      map['status_type'] = Variable<String>(converter.toSql(statusType.value));
    }
    if (priority.present) {
      map['priority'] = Variable<int>(priority.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritePlaceTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('description: $description, ')
          ..write('photos: $photos, ')
          ..write('placeType: $placeType, ')
          ..write('date: $date, ')
          ..write('statusType: $statusType, ')
          ..write('priority: $priority')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $FavoritePlaceTableTable favoritePlaceTable =
      $FavoritePlaceTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favoritePlaceTable];
}
