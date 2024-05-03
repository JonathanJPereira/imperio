// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'championship.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Championship _$ChampionshipFromJson(Map<String, dynamic> json) => Championship(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ChampionshipToJson(Championship instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'createdAt': instance.createdAt.toIso8601String(),
    };
