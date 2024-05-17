// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'odd_match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OddMatch _$OddMatchFromJson(Map<String, dynamic> json) => OddMatch(
      id: json['id'] as String,
      matchId: json['matchId'] as String,
      data: json['data'] as String,
      teamA1xbetOdd: (json['team_a_1xbet_odd'] as num).toDouble(),
      teamABetsafeOdd: (json['team_a_betsafe_odd'] as num).toDouble(),
      teamABetssonOdd: (json['team_a_betsson_odd'] as num).toDouble(),
      teamB1xbetOdd: (json['team_b_1xbet_odd'] as num).toDouble(),
      teamBBetsafeOdd: (json['team_b_betsafe_odd'] as num).toDouble(),
      teamBBetssonOdd: (json['team_b_betsson_odd'] as num).toDouble(),
      draw1xbetOdd: (json['draw_1xbet_odd'] as num).toDouble(),
      drawBetsafeOdd: (json['draw_betsafe_odd'] as num).toDouble(),
      drawBetssonOdd: (json['draw_betsson_odd'] as num).toDouble(),
    );

Map<String, dynamic> _$OddMatchToJson(OddMatch instance) => <String, dynamic>{
      'id': instance.id,
      'matchId': instance.matchId,
      'data': instance.data,
      'team_a_1xbet_odd': instance.teamA1xbetOdd,
      'team_a_betsafe_odd': instance.teamABetsafeOdd,
      'team_a_betsson_odd': instance.teamABetssonOdd,
      'team_b_1xbet_odd': instance.teamB1xbetOdd,
      'team_b_betsafe_odd': instance.teamBBetsafeOdd,
      'team_b_betsson_odd': instance.teamBBetssonOdd,
      'draw_1xbet_odd': instance.draw1xbetOdd,
      'draw_betsafe_odd': instance.drawBetsafeOdd,
      'draw_betsson_odd': instance.drawBetssonOdd,
    };
