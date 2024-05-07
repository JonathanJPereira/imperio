// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'won_bet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WonBet _$WonBetFromJson(Map<String, dynamic> json) => WonBet(
      id: json['id'] as String,
      user: json['user'] as String,
      userAvatar: json['user_avatar'] as String,
      platform: json['platform'] as String,
      score: (json['score'] as num).toDouble(),
    );

Map<String, dynamic> _$WonBetToJson(WonBet instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'user_avatar': instance.userAvatar,
      'platform': instance.platform,
      'score': instance.score,
    };
