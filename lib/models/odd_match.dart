import 'package:json_annotation/json_annotation.dart';

part 'odd_match.g.dart';

@JsonSerializable()
class OddMatch {
  final String id;
  final String matchId;
  final String data;
  @JsonKey(name: 'team_a_1xbet_odd')
  final double teamA1xbetOdd;
  @JsonKey(name: 'team_a_betsafe_odd')
  final double teamABetsafeOdd;
  @JsonKey(name: 'team_a_betsson_odd')
  final double teamABetssonOdd;
  @JsonKey(name: 'team_b_1xbet_odd')
  final double teamB1xbetOdd;
  @JsonKey(name: 'team_b_betsafe_odd')
  final double teamBBetsafeOdd;
  @JsonKey(name: 'team_b_betsson_odd')
  final double teamBBetssonOdd;
  @JsonKey(name: 'draw_1xbet_odd')
  final double draw1xbetOdd;
  @JsonKey(name: 'draw_betsafe_odd')
  final double drawBetsafeOdd;
  @JsonKey(name: 'draw_betsson_odd')
  final double drawBetssonOdd;

  OddMatch({
    required this.id,
    required this.matchId,
    required this.data,
    required this.teamA1xbetOdd,
    required this.teamABetsafeOdd,
    required this.teamABetssonOdd,
    required this.teamB1xbetOdd,
    required this.teamBBetsafeOdd,
    required this.teamBBetssonOdd,
    required this.draw1xbetOdd,
    required this.drawBetsafeOdd,
    required this.drawBetssonOdd,
  });

  factory OddMatch.fromJson(Map<String, dynamic> json) =>
      _$OddMatchFromJson(json);
  Map<String, dynamic> toJson() => _$OddMatchToJson(this);
}
