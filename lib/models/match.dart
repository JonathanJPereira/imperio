import 'package:json_annotation/json_annotation.dart';

part 'match.g.dart';

@JsonSerializable()
class Match {
  final String id;
  final DateTime date;
  @JsonKey(name: 'team_a')
  final String teamA;
  @JsonKey(name: 'team_b')
  final String teamB;
  @JsonKey(name: 'team_a_score')
  final int teamAScore;
  @JsonKey(name: 'team_b_score')
  final int teamBScore;
  @JsonKey(name: '1xbet_odds_avg')
  final double onexbetOddsAvg;
  @JsonKey(name: 'betsafe_odds_avg')
  final double betsafeOddsAvg;
  @JsonKey(name: 'betsson_odds_avg')
  final double betssonOddsAvg;
  @JsonKey(name: 'likes_count')
  final int likesCount;
  @JsonKey(name: 'stars_count')
  final int starsCount;
  @JsonKey(name: 'views_count')
  final int viewsCount;
  @JsonKey(name: 'shares_count')
  final int sharesCount;
  final String channels;
  final String stadium;
  final String referee;
  @JsonKey(name: 'referee_avatar')
  final String refereeAvatar;
  @JsonKey(name: 'referee_stats')
  final String refereeStats;
  @JsonKey(name: 'team_a_image')
  final String teamAImage;
  @JsonKey(name: 'team_b_image')
  final String teamBImage;
  @JsonKey(name: 'red_card_media')
  final double redCardMedia;
  @JsonKey(name: 'yellow_card_media')
  final double yellowCardMedia;
  @JsonKey(name: 'team_a_stats')
  final String teamAStats;
  @JsonKey(name: 'team_b_stats')
  final String teamBStats;

  Match({
    required this.id,
    required this.date,
    required this.teamA,
    required this.teamB,
    required this.teamAScore,
    required this.teamBScore,
    required this.onexbetOddsAvg,
    required this.betsafeOddsAvg,
    required this.betssonOddsAvg,
    required this.likesCount,
    required this.starsCount,
    required this.viewsCount,
    required this.sharesCount,
    required this.channels,
    required this.stadium,
    required this.referee,
    required this.refereeAvatar,
    required this.refereeStats,
    required this.teamAImage,
    required this.teamBImage,
    required this.redCardMedia,
    required this.yellowCardMedia,
    required this.teamAStats,
    required this.teamBStats,
  });

  factory Match.fromJson(Map<String, dynamic> json) => _$MatchFromJson(json);
  Map<String, dynamic> toJson() => _$MatchToJson(this);
}
