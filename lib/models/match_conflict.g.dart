// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_conflict.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchConflict _$MatchConflictFromJson(Map<String, dynamic> json) =>
    MatchConflict(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      teamAWon: (json['team_a_won'] as num).toInt(),
      teamBWon: (json['team_b_won'] as num).toInt(),
      draw: (json['draw'] as num).toInt(),
      championshipName: json['championship_name'] as String,
      championshipImage: json['championshio_image'] as String,
      matchId: json['matchId'] as String,
    );

Map<String, dynamic> _$MatchConflictToJson(MatchConflict instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'team_a_won': instance.teamAWon,
      'team_b_won': instance.teamBWon,
      'draw': instance.draw,
      'championship_name': instance.championshipName,
      'championshio_image': instance.championshipImage,
      'matchId': instance.matchId,
    };
