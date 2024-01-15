import 'package:game_buddy/features/message/data/models/conversation_model.dart';
import 'package:hive/hive.dart';

part 'conversation_hive_model.g.dart';

@HiveType(typeId: 4)
class ConversationHiveModel {
  @HiveField(0)
  final List<String>? participants;
  @HiveField(1)
  List<String>? messages;
  ConversationHiveModel({this.participants, this.messages});

  Conversation toConversation() =>
      Conversation(participants: participants, messages: messages);

  static ConversationHiveModel fromConversation(Conversation conv) =>
      ConversationHiveModel(
          participants: conv.participants, messages: conv.messages);
}
