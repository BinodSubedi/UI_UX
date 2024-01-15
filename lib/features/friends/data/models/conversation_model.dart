import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_buddy/features/message/domain/entities/conversation_entity.dart';

part 'conversation_model.freezed.dart';
part 'conversation_model.g.dart';

@freezed
class Conversation with _$Conversation {
  // List<String> participants;
  // List<String>? messages;
  const factory Conversation(
      {List<String>? participants, List<String>? messages}) = _Conversation;

  factory Conversation.fromJson(Map<String, Object?> json) =>
      _$ConversationFromJson(json);
}

class ConversationModel {
  final List<String>? participants;
  final List<String>? messages;

  late final Conversation _conversation = _conversationinstance;

  ConversationModel({this.participants, this.messages});

  Conversation get _conversationinstance =>
      Conversation(participants: participants, messages: messages);

  ConversationEntity toEntity() => ConversationEntity(
      participants: _conversation.participants,
      messages: _conversation.messages);

  static toEntityDirect(Conversation conversation) => ConversationEntity(
      participants: conversation.participants, messages: conversation.messages);
}
