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
  String _tell = '';

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
  void setTell(String value) {
    _tell = value;
  }

  @action
  void setPassword(String value) {
    _password = value;
  }

  @computed
  bool get isEmailValid => _isValidEmail(_email);

  @computed
  bool get isTellValid => _isValidTell(_tell);

  @computed
  bool get isPasswordValid => _isValidPassword(_password);

  @computed
  bool get isLoading => _isLoading;

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  bool _isValidTell(String phoneNumber) {
    final phoneRegex = RegExp(r'^\(\d{2}\) \d{4,5}-\d{4}$');
    return phoneRegex.hasMatch(phoneNumber);
  }

  bool _isValidPassword(String password) {
    return password.isNotEmpty;
  }

  @action
  Future<void> login() async {
    if (!isPasswordValid) {
      throw Exception('Senha inválida.');
    }

    if (!isEmailValid && !isTellValid) {
      throw Exception('Email ou telefone inválidos.');
    }

    _isLoading = true;

    final loginStartTime = DateTime.now();
    try {
      if (isEmailValid) {
        _authToken = await _loginService.loginWithEmail(_email, _password);
      } else if (isTellValid) {
        _authToken = await _loginService.loginWithPhone(_tell, _password);
      }

      if (_authToken != null) {
        await _storeToken(_authToken!);
      } else {
        throw Exception('Falha no login: token nulo');
      }
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

  @action
  Future<bool> checkToken() async {
    _authToken = await _retrieveToken();
    return _authToken != null;
  }
}
