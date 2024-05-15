// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bet _$BetFromJson(Map<String, dynamic> json) => Bet(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      name: json['name'] as String,
      avatar: json['avatar'] as String,
      betScore: (json['bet_score'] as num).toDouble(),
      stat: json['stat'] as String,
      matchId: json['matchId'] as String,
    );

Map<String, dynamic> _$BetToJson(Bet instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'name': instance.name,
      'avatar': instance.avatar,
      'bet_score': instance.betScore,
      'stat': instance.stat,
      'matchId': instance.matchId,
    };
