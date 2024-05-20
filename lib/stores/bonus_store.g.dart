// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bonus_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BonusStore on _BonusStore, Store {
  late final _$bonusesAtom =
      Atom(name: '_BonusStore.bonuses', context: context);

  @override
  ObservableList<Bonus> get bonuses {
    _$bonusesAtom.reportRead();
    return super.bonuses;
  }

  @override
  set bonuses(ObservableList<Bonus> value) {
    _$bonusesAtom.reportWrite(value, super.bonuses, () {
      super.bonuses = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_BonusStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_BonusStore.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$fetchBonusesAsyncAction =
      AsyncAction('_BonusStore.fetchBonuses', context: context);

  @override
  Future<void> fetchBonuses() {
    return _$fetchBonusesAsyncAction.run(() => super.fetchBonuses());
  }

  @override
  String toString() {
    return '''
bonuses: ${bonuses},
isLoading: ${isLoading},
errorMessage: ${errorMessage}
    ''';
  }
}
