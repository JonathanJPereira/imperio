import 'package:mobx/mobx.dart';
import 'package:imperio/services/login_service.dart';
import 'package:imperio/models/auth_token/auth_token.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  final LoginService _loginService;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  _LoginStore(this._loginService);

  @observable
  String email = '';

  @observable
  String phone = '';

  @observable
  String password = '';

  @observable
  bool passwordIsVisible = false;

  @observable
  bool _isLoading = false;

  @observable
  AuthToken? _authToken;

  @action
  void setEmail(String value) {
    email = value;
  }

  @action
  void setPhone(String value) {
    phone = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @computed
  bool get isEmailValid => _isValidEmail(email);

  @computed
  bool get isPhoneValid => _isValidPhone(phone);

  @computed
  bool get isPasswordValid => _isValidPassword(password);

  @computed
  bool get isLoading => _isLoading;

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  bool _isValidPhone(String phoneNumber) {
    final phoneRegex = RegExp(r'^\(\d{2}\) \d{4,5}-\d{4}$');
    return phoneRegex.hasMatch(phoneNumber);
  }

  bool _isValidPassword(String password) {
    return password.isNotEmpty;
  }

  void togglePasswordVisibility() {
    passwordIsVisible = !passwordIsVisible;
  }

  @action
  Future<void> login() async {
    if (!isPasswordValid) {
      throw Exception('Senha inválida.');
    }

    if (!isEmailValid && !isPhoneValid) {
      throw Exception('Email ou telefone inválidos.');
    }

    _isLoading = true;

    final loginStartTime = DateTime.now();
    try {
      if (isEmailValid) {
        _authToken = await _loginService.loginWithEmail(email, password);
      } else if (isPhoneValid) {
        _authToken = await _loginService.loginWithPhone(phone, password);
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

  Future<void> logout() async {
    await _secureStorage.delete(key: 'authToken');
    await _secureStorage.delete(key: 'refreshToken');
  }

  @action
  Future<bool> checkToken() async {
    _authToken = await _retrieveToken();
    return _authToken != null;
  }

  @action
  Future<void> refreshToken() async {
    _isLoading = true;
    try {
      final storedToken = await _retrieveToken();
      if (storedToken?.refreshToken != null) {
        final newToken =
            await _loginService.refreshToken(storedToken!.refreshToken);
        if (newToken != null) {
          _authToken = newToken;
          await _storeToken(newToken);
        } else {
          throw Exception('Falha ao obter novo token');
        }
      } else {
        throw Exception('Refresh token não encontrado');
      }
    } catch (e) {
      throw Exception('Falha ao atualizar token: ${e.toString()}');
    } finally {
      _isLoading = false;
    }
  }
}
