// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      fullName: json['fullName'] as String,
      password: json['password'] as String?,
      userName: json['userName'] as String,
      gamesAnsweres: (json['gamesAnsweres'] as List<dynamic>?)
          ?.map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList(),
      passwordChangedAt: json['passwordChangedAt'] as String?,
      games: (json['games'] as List<dynamic>?)
          ?.map((e) => Game.fromJson(e as Map<String, dynamic>))
          .toList(),
      friends: (json['friends'] as List<dynamic>?)
          ?.map((e) => Friend.fromJson(e as Map<String, dynamic>))
          .toList(),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'fullName': instance.fullName,
      'password': instance.password,
      'userName': instance.userName,
      'gamesAnsweres': instance.gamesAnsweres,
      'passwordChangedAt': instance.passwordChangedAt,
      'games': instance.games,
      'friends': instance.friends,
      'token': instance.token,
    };
