// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matches_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MatchesStore on _MatchesStore, Store {
  Computed<List<String>>? _$teamAFactsComputed;

  @override
  List<String> get teamAFacts =>
      (_$teamAFactsComputed ??= Computed<List<String>>(() => super.teamAFacts,
              name: '_MatchesStore.teamAFacts'))
          .value;
  Computed<List<String>>? _$teamBFactsComputed;

  @override
  List<String> get teamBFacts =>
      (_$teamBFactsComputed ??= Computed<List<String>>(() => super.teamBFacts,
              name: '_MatchesStore.teamBFacts'))
          .value;
  Computed<List<String>>? _$refereeFactsComputed;

  @override
  List<String> get refereeFacts => (_$refereeFactsComputed ??=
          Computed<List<String>>(() => super.refereeFacts,
              name: '_MatchesStore.refereeFacts'))
      .value;
  Computed<Match?>? _$currentMatchComputed;

  @override
  Match? get currentMatch =>
      (_$currentMatchComputed ??= Computed<Match?>(() => super.currentMatch,
              name: '_MatchesStore.currentMatch'))
          .value;

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

  late final _$_currentMatchIdAtom =
      Atom(name: '_MatchesStore._currentMatchId', context: context);

  @override
  String get _currentMatchId {
    _$_currentMatchIdAtom.reportRead();
    return super._currentMatchId;
  }

  @override
  set _currentMatchId(String value) {
    _$_currentMatchIdAtom.reportWrite(value, super._currentMatchId, () {
      super._currentMatchId = value;
    });
  }

  late final _$matchBetsAtom =
      Atom(name: '_MatchesStore.matchBets', context: context);

  @override
  ObservableMap<String, List<Bet>> get matchBets {
    _$matchBetsAtom.reportRead();
    return super.matchBets;
  }

  @override
  set matchBets(ObservableMap<String, List<Bet>> value) {
    _$matchBetsAtom.reportWrite(value, super.matchBets, () {
      super.matchBets = value;
    });
  }

  late final _$matchConflictsAtom =
      Atom(name: '_MatchesStore.matchConflicts', context: context);

  @override
  ObservableMap<String, List<MatchConflict>> get matchConflicts {
    _$matchConflictsAtom.reportRead();
    return super.matchConflicts;
  }

  @override
  set matchConflicts(ObservableMap<String, List<MatchConflict>> value) {
    _$matchConflictsAtom.reportWrite(value, super.matchConflicts, () {
      super.matchConflicts = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_MatchesStore.isLoading', context: context);

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
      Atom(name: '_MatchesStore.errorMessage', context: context);

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

  late final _$fetchMatchesAsyncAction =
      AsyncAction('_MatchesStore.fetchMatches', context: context);

  @override
  Future<void> fetchMatches() {
    return _$fetchMatchesAsyncAction.run(() => super.fetchMatches());
  }

  late final _$enrichMatchAsyncAction =
      AsyncAction('_MatchesStore.enrichMatch', context: context);

  @override
  Future<void> enrichMatch(String matchId) {
    return _$enrichMatchAsyncAction.run(() => super.enrichMatch(matchId));
  }

  late final _$_MatchesStoreActionController =
      ActionController(name: '_MatchesStore', context: context);

  @override
  void setCurrentMatchId(String id) {
    final _$actionInfo = _$_MatchesStoreActionController.startAction(
        name: '_MatchesStore.setCurrentMatchId');
    try {
      return super.setCurrentMatchId(id);
    } finally {
      _$_MatchesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
matches: ${matches},
matchBets: ${matchBets},
matchConflicts: ${matchConflicts},
isLoading: ${isLoading},
errorMessage: ${errorMessage},
teamAFacts: ${teamAFacts},
teamBFacts: ${teamBFacts},
refereeFacts: ${refereeFacts},
currentMatch: ${currentMatch}
    ''';
  }
}
