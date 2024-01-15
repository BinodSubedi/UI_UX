// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserEntityHiveModelAdapter extends TypeAdapter<UserEntityHiveModel> {
  @override
  final int typeId = 1;

  @override
  UserEntityHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserEntityHiveModel(
      fullName: fields[0] as String,
      userName: fields[2] as String,
      friends: (fields[6] as List?)?.cast<FriendHiveModel>(),
      games: (fields[5] as List?)?.cast<GameHiveModel>(),
      gamesAnsweres: (fields[3] as List?)
          ?.map((dynamic e) => (e as List).cast<String>())
          .toList(),
      password: fields[1] as String?,
      passwordChangedAt: fields[4] as String?,
      token: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserEntityHiveModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.fullName)
      ..writeByte(1)
      ..write(obj.password)
      ..writeByte(2)
      ..write(obj.userName)
      ..writeByte(3)
      ..write(obj.gamesAnsweres)
      ..writeByte(4)
      ..write(obj.passwordChangedAt)
      ..writeByte(5)
      ..write(obj.games)
      ..writeByte(6)
      ..write(obj.friends)
      ..writeByte(7)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEntityHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
