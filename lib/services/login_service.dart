import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:imperio/models/auth_token.dart';

class LoginService {
  final Dio _dio;

  LoginService(this._dio);

  Future<AuthToken> loginWithEmail(String email, String password) async {
    return _login({'email': email, 'password': password});
  }

  Future<AuthToken> loginWithPhone(String phone, String password) async {
    return _login({'phone': phone, 'password': password});
  }

  Future<AuthToken?> refreshToken(String refreshToken) async {
    return _login({'refreshToken': refreshToken});
  }

  Future<AuthToken> _login(Map<String, dynamic> data) async {
    try {
      final apiUrl = dotenv.env['API_URL'] ?? '';
      final response = await _dio.post(
        '$apiUrl/login',
        data: data,
      );

      if (response.data != null &&
          response.data['auth_token'] != null &&
          response.data['refresh_token'] != null) {
        return AuthToken.fromJson(response.data);
      } else {
        throw Exception('Invalid response data');
      }
    } on DioException catch (e) {
      throw Exception('Failed to login');
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }
}
