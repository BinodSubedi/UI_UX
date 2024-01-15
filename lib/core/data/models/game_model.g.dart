// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Game _$$_GameFromJson(Map<String, dynamic> json) => _$_Game(
      gameName: json['gameName'] as String,
      gameType: json['gameType'] as String,
      gameDescription: json['gameDescription'] as String,
      gameImage: json['gameImage'] as String,
      popularity: json['popularity'] as int,
      gameQuestions: (json['gameQuestions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_GameToJson(_$_Game instance) => <String, dynamic>{
      'gameName': instance.gameName,
      'gameType': instance.gameType,
      'gameDescription': instance.gameDescription,
      'gameImage': instance.gameImage,
      'popularity': instance.popularity,
      'gameQuestions': instance.gameQuestions,
    };
