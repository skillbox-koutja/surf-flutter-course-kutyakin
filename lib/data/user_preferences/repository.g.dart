// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveUserPreferencesAdapter extends TypeAdapter<HiveUserPreferences> {
  @override
  final int typeId = 0;

  @override
  HiveUserPreferences read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveUserPreferences(
      themeMode: fields[0] as String,
      radius: fields[1] as double,
      selectedPlaceTypes: (fields[2] as List).cast<String>(),
      seenOnboarding: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, HiveUserPreferences obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.themeMode)
      ..writeByte(1)
      ..write(obj.radius)
      ..writeByte(2)
      ..write(obj.selectedPlaceTypes)
      ..writeByte(3)
      ..write(obj.seenOnboarding);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveUserPreferencesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
