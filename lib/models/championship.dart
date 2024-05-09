import 'package:json_annotation/json_annotation.dart';

part 'championship.g.dart';

@JsonSerializable()
class Championship {
  final String id;
  final String name;
  final String image;
  final DateTime createdAt;

  Championship({
    required this.id,
    required this.name,
    required this.image,
    required this.createdAt,
  });

  factory Championship.fromJson(Map<String, dynamic> json) => _$ChampionshipFromJson(json);

  Map<String, dynamic> toJson() => _$ChampionshipToJson(this);
}
