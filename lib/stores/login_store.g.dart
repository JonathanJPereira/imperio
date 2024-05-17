// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on _LoginStore, Store {
  Computed<bool>? _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: '_LoginStore.isEmailValid'))
          .value;
  Computed<bool>? _$isPhoneValidComputed;

  @override
  bool get isPhoneValid =>
      (_$isPhoneValidComputed ??= Computed<bool>(() => super.isPhoneValid,
              name: '_LoginStore.isPhoneValid'))
          .value;
  Computed<bool>? _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: '_LoginStore.isPasswordValid'))
          .value;
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading => (_$isLoadingComputed ??=
          Computed<bool>(() => super.isLoading, name: '_LoginStore.isLoading'))
      .value;

  late final _$emailAtom = Atom(name: '_LoginStore.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$phoneAtom = Atom(name: '_LoginStore.phone', context: context);

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_LoginStore.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$passwordIsVisibleAtom =
      Atom(name: '_LoginStore.passwordIsVisible', context: context);

  @override
  bool get passwordIsVisible {
    _$passwordIsVisibleAtom.reportRead();
    return super.passwordIsVisible;
  }

  @override
  set passwordIsVisible(bool value) {
    _$passwordIsVisibleAtom.reportWrite(value, super.passwordIsVisible, () {
      super.passwordIsVisible = value;
    });
  }

  late final _$_isLoadingAtom =
      Atom(name: '_LoginStore._isLoading', context: context);

  @override
  bool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  late final _$_authTokenAtom =
      Atom(name: '_LoginStore._authToken', context: context);

  @override
  AuthToken? get _authToken {
    _$_authTokenAtom.reportRead();
    return super._authToken;
  }

  @override
  set _authToken(AuthToken? value) {
    _$_authTokenAtom.reportWrite(value, super._authToken, () {
      super._authToken = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_LoginStore.login', context: context);

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$checkTokenAsyncAction =
      AsyncAction('_LoginStore.checkToken', context: context);

  @override
  Future<bool> checkToken() {
    return _$checkTokenAsyncAction.run(() => super.checkToken());
  }

  late final _$refreshTokenAsyncAction =
      AsyncAction('_LoginStore.refreshToken', context: context);

  @override
  Future<void> refreshToken() {
    return _$refreshTokenAsyncAction.run(() => super.refreshToken());
  }

  late final _$_LoginStoreActionController =
      ActionController(name: '_LoginStore', context: context);

  @override
  void setEmail(String value) {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
phone: ${phone},
password: ${password},
passwordIsVisible: ${passwordIsVisible},
isEmailValid: ${isEmailValid},
isPhoneValid: ${isPhoneValid},
isPasswordValid: ${isPasswordValid},
isLoading: ${isLoading}
    ''';
  }
}
