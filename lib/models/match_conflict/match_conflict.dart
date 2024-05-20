import 'package:json_annotation/json_annotation.dart';

part 'match_conflict.g.dart';

@JsonSerializable()
class MatchConflict {
  final String id;
  final DateTime date;
  @JsonKey(name: 'team_a_won')
  final int teamAWon;
  @JsonKey(name: 'team_b_won')
  final int teamBWon;
  final int draw;
  @JsonKey(name: 'championship_name')
  final String championshipName;
  @JsonKey(name: 'championshio_image')
  final String championshipImage;

  final String matchId;

  MatchConflict({
    required this.id,
    required this.date,
    required this.teamAWon,
    required this.teamBWon,
    required this.draw,
    required this.championshipName,
    required this.championshipImage,
    required this.matchId,
  });

  factory MatchConflict.fromJson(Map<String, dynamic> json) =>
      _$MatchConflictFromJson(json);
  Map<String, dynamic> toJson() => _$MatchConflictToJson(this);
}
