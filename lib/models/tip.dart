import 'package:json_annotation/json_annotation.dart';

part 'tip.g.dart';

@JsonSerializable()
class Tip {
  final String id;
  final String title;
  final String description;
  final String image;

  Tip({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
  });

  factory Tip.fromJson(Map<String, dynamic> json) => _$TipFromJson(json);
  Map<String, dynamic> toJson() => _$TipToJson(this);
}
