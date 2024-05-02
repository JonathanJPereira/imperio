import 'package:json_annotation/json_annotation.dart';

part 'sport.g.dart';

@JsonSerializable()
class Sport {
  String id;
  String name;
  String image;

  Sport({required this.id, required this.name, required this.image});

  factory Sport.fromJson(Map<String, dynamic> json) => _$SportFromJson(json);

  Map<String, dynamic> toJson() => _$SportToJson(this);
}
