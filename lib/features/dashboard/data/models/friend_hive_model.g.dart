// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FriendHiveModelAdapter extends TypeAdapter<FriendHiveModel> {
  @override
  final int typeId = 3;

  @override
  FriendHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FriendHiveModel(
      userName: fields[2] as String,
      conversation: fields[3] as ConversationHiveModel,
      friend: fields[0] as dynamic,
      status: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FriendHiveModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.friend)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.userName)
      ..writeByte(3)
      ..write(obj.conversation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FriendHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
