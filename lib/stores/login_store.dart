import 'package:mobx/mobx.dart';
import 'package:imperio/services/login_service.dart';
import 'package:imperio/models/auth_token.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  final LoginService _loginService;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  _LoginStore(this._loginService);

  @observable
  String _email = '';

  @observable
  String _password = '';

  @observable
  bool _isLoading = false;

  @observable
  AuthToken? _authToken;

  @action
  void setEmail(String value) {
    _email = value;
  }

  @action
  void setPassword(String value) {
    _password = value;
  }

  @computed
  bool get isEmailValid => _isValidEmail(_email);

  @computed
  bool get isPasswordValid => _isValidPassword(_password);

  @computed
  bool get isLoading => _isLoading;

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  bool _isValidPassword(String password) {
    return password.isNotEmpty;
  }

  @action
  Future<void> login() async {
    if (!isEmailValid || !isPasswordValid) {
      throw Exception('Email ou senha inválidos.');
    }

    _isLoading = true;

    final loginStartTime = DateTime.now();
    try {
      _authToken = await _loginService.login(_email, _password);
      await _storeToken(_authToken!);
    } catch (e) {
      throw Exception('Falha no login: ${e.toString()}');
    } finally {
      final elapsed = DateTime.now().difference(loginStartTime);
      if (elapsed < const Duration(seconds: 5)) {
        await Future.delayed(const Duration(seconds: 5) - elapsed);
      }
      _isLoading = false;
    }
  }

  Future<void> _storeToken(AuthToken token) async {
    await _secureStorage.write(key: 'authToken', value: token.authToken);
    await _secureStorage.write(key: 'refreshToken', value: token.refreshToken);
  }

  Future<AuthToken?> _retrieveToken() async {
    final authToken = await _secureStorage.read(key: 'authToken');
    final refreshToken = await _secureStorage.read(key: 'refreshToken');
    if (authToken != null && refreshToken != null) {
      return AuthToken(authToken: authToken, refreshToken: refreshToken);
    }
    return null;
  }

  Future<void> _deleteToken() async {
    await _secureStorage.delete(key: 'authToken');
    await _secureStorage.delete(key: 'refreshToken');
  }
}
