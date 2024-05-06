import 'package:json_annotation/json_annotation.dart';

part 'bonus.g.dart';

@JsonSerializable()
class Bonus {
  final String platform;
  final String discount;
  final String id;

  Bonus({
    required this.platform,
    required this.discount,
    required this.id,
  });

  factory Bonus.fromJson(Map<String, dynamic> json) => _$BonusFromJson(json);
  
  Map<String, dynamic> toJson() => _$BonusToJson(this);
}
