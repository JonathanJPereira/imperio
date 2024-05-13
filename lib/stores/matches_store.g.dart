// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matches_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MatchesStore on _MatchesStore, Store {
  late final _$matchesAtom =
      Atom(name: '_MatchesStore.matches', context: context);

  @override
  ObservableList<Match> get matches {
    _$matchesAtom.reportRead();
    return super.matches;
  }

  @override
  set matches(ObservableList<Match> value) {
    _$matchesAtom.reportWrite(value, super.matches, () {
      super.matches = value;
    });
  }

  late final _$fetchMatchesAsyncAction =
      AsyncAction('_MatchesStore.fetchMatches', context: context);

  @override
  Future<void> fetchMatches() {
    return _$fetchMatchesAsyncAction.run(() => super.fetchMatches());
  }

  @override
  String toString() {
    return '''
matches: ${matches}
    ''';
  }
}
