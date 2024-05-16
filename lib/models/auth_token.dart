import 'package:json_annotation/json_annotation.dart';

part 'auth_token.g.dart';

@JsonSerializable()
class AuthToken {
  @JsonKey(name: 'auth_token')
  final String authToken;

  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  AuthToken({
    required this.authToken,
    required this.refreshToken,
  });

  factory AuthToken.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenFromJson(json);
  Map<String, dynamic> toJson() => _$AuthTokenToJson(this);
}
