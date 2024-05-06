// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bonus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bonus _$BonusFromJson(Map<String, dynamic> json) => Bonus(
      platform: json['platform'] as String,
      discount: json['discount'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$BonusToJson(Bonus instance) => <String, dynamic>{
      'platform': instance.platform,
      'discount': instance.discount,
      'id': instance.id,
    };
