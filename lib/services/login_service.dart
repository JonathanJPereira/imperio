import 'package:dio/dio.dart';
import 'package:imperio/models/auth_token.dart';

class LoginService {
  final Dio _dio;

  LoginService(this._dio);

  Future<AuthToken> login(String email, String password) async {
    try {
      final response = await _dio.post(
        'https://6569cc7dde53105b0dd7af5c.mockapi.io/loginn',
        data: {
          'email': email,
          'password': password,
        },
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
