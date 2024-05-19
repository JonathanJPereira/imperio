// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'odds_matches_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OddsMatchesStore on _OddsMatchesStore, Store {
  late final _$oddsMatchesAtom =
      Atom(name: '_OddsMatchesStore.oddsMatches', context: context);

  @override
  ObservableList<OddMatch> get oddsMatches {
    _$oddsMatchesAtom.reportRead();
    return super.oddsMatches;
  }

  @override
  set oddsMatches(ObservableList<OddMatch> value) {
    _$oddsMatchesAtom.reportWrite(value, super.oddsMatches, () {
      super.oddsMatches = value;
    });
  }

  late final _$fetchOddsMatchesAsyncAction =
      AsyncAction('_OddsMatchesStore.fetchOddsMatches', context: context);

  @override
  Future<void> fetchOddsMatches(String matchId) {
    return _$fetchOddsMatchesAsyncAction
        .run(() => super.fetchOddsMatches(matchId));
  }

  @override
  String toString() {
    return '''
oddsMatches: ${oddsMatches}
    ''';
  }
}
