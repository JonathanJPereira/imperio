// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'won_bets_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WonBetsStore on _WonBetsStore, Store {
  late final _$wonBetsAtom =
      Atom(name: '_WonBetsStore.wonBets', context: context);

  @override
  ObservableList<WonBet> get wonBets {
    _$wonBetsAtom.reportRead();
    return super.wonBets;
  }

  @override
  set wonBets(ObservableList<WonBet> value) {
    _$wonBetsAtom.reportWrite(value, super.wonBets, () {
      super.wonBets = value;
    });
  }

  late final _$fetchWonBetsAsyncAction =
      AsyncAction('_WonBetsStore.fetchWonBets', context: context);

  @override
  Future<void> fetchWonBets() {
    return _$fetchWonBetsAsyncAction.run(() => super.fetchWonBets());
  }

  @override
  String toString() {
    return '''
wonBets: ${wonBets}
    ''';
  }
}
