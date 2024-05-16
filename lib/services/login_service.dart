import 'package:dio/dio.dart';
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

  Future<AuthToken> _login(Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(
        'https://6569cc7dde53105b0dd7af5c.mockapi.io/login',
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
      print(e.message);
      throw Exception('Failed to login');
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load data');
    }
  }
}
