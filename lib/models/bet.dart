import 'package:json_annotation/json_annotation.dart';

part 'bet.g.dart';

@JsonSerializable()
class Bet {
  final String id;
  final DateTime date;
  final String name;
  final String avatar;
  @JsonKey(name: 'bet_score')
  final double betScore;
  final String stat;
  final String matchId;

  Bet({
    required this.id,
    required this.date,
    required this.name,
    required this.avatar,
    required this.betScore,
    required this.stat,
    required this.matchId,
  });

  factory Bet.fromJson(Map<String, dynamic> json) => _$BetFromJson(json);
  Map<String, dynamic> toJson() => _$BetToJson(this);
}
