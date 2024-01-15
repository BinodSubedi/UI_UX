// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameHiveModelAdapter extends TypeAdapter<GameHiveModel> {
  @override
  final int typeId = 2;

  @override
  GameHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GameHiveModel(
      gameName: fields[0] as String,
      gameType: fields[1] as String,
      gameDescription: fields[2] as String,
      gameImage: fields[3] as String,
      popularity: fields[4] as int,
      gameQuestions: (fields[5] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, GameHiveModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.gameName)
      ..writeByte(1)
      ..write(obj.gameType)
      ..writeByte(2)
      ..write(obj.gameDescription)
      ..writeByte(3)
      ..write(obj.gameImage)
      ..writeByte(4)
      ..write(obj.popularity)
      ..writeByte(5)
      ..write(obj.gameQuestions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
