// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Match _$MatchFromJson(Map<String, dynamic> json) => Match(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      teamA: json['team_a'] as String,
      teamB: json['team_b'] as String,
      teamAScore: (json['team_a_score'] as num).toInt(),
      teamBScore: (json['team_b_score'] as num).toInt(),
      onexbetOddsAvg: (json['1xbet_odds_avg'] as num).toDouble(),
      betsafeOddsAvg: (json['betsafe_odds_avg'] as num).toDouble(),
      betssonOddsAvg: (json['betsson_odds_avg'] as num).toDouble(),
      likesCount: (json['likes_count'] as num).toInt(),
      starsCount: (json['stars_count'] as num).toInt(),
      viewsCount: (json['views_count'] as num).toInt(),
      sharesCount: (json['shares_count'] as num).toInt(),
      channels: json['channels'] as String,
      stadium: json['stadium'] as String,
      referee: json['referee'] as String,
      refereeAvatar: json['referee_avatar'] as String,
      refereeStats: json['referee_stats'] as String,
      teamAImage: json['team_a_image'] as String,
      teamBImage: json['team_b_image'] as String,
      redCardMedia: (json['red_card_media'] as num).toDouble(),
      yellowCardMedia: (json['yellow_card_media'] as num).toDouble(),
      teamAStats: json['team_a_stats'] as String,
      teamBStats: json['team_b_stats'] as String,
    );

Map<String, dynamic> _$MatchToJson(Match instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'team_a': instance.teamA,
      'team_b': instance.teamB,
      'team_a_score': instance.teamAScore,
      'team_b_score': instance.teamBScore,
      '1xbet_odds_avg': instance.onexbetOddsAvg,
      'betsafe_odds_avg': instance.betsafeOddsAvg,
      'betsson_odds_avg': instance.betssonOddsAvg,
      'likes_count': instance.likesCount,
      'stars_count': instance.starsCount,
      'views_count': instance.viewsCount,
      'shares_count': instance.sharesCount,
      'channels': instance.channels,
      'stadium': instance.stadium,
      'referee': instance.referee,
      'referee_avatar': instance.refereeAvatar,
      'referee_stats': instance.refereeStats,
      'team_a_image': instance.teamAImage,
      'team_b_image': instance.teamBImage,
      'red_card_media': instance.redCardMedia,
      'yellow_card_media': instance.yellowCardMedia,
      'team_a_stats': instance.teamAStats,
      'team_b_stats': instance.teamBStats,
    };
