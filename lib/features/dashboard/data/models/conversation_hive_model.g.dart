// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConversationHiveModelAdapter extends TypeAdapter<ConversationHiveModel> {
  @override
  final int typeId = 4;

  @override
  ConversationHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConversationHiveModel(
      participants: (fields[0] as List?)?.cast<String>(),
      messages: (fields[1] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, ConversationHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.participants)
      ..writeByte(1)
      ..write(obj.messages);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConversationHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
