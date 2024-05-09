import 'package:json_annotation/json_annotation.dart';

part 'won_bet.g.dart';

@JsonSerializable()
class WonBet {
  final String id;
  final String user;
  @JsonKey(name: 'user_avatar')
  final String userAvatar;
  final String platform;
  final double score;

  WonBet({
    required this.id,
    required this.user,
    required this.userAvatar,
    required this.platform,
    required this.score,
  });

  factory WonBet.fromJson(Map<String, dynamic> json) => _$WonBetFromJson(json);
  Map<String, dynamic> toJson() => _$WonBetToJson(this);
}
