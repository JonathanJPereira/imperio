// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sports_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SportsStore on _SportsStore, Store {
  late final _$sportsAtom = Atom(name: '_SportsStore.sports', context: context);

  @override
  ObservableList<Sport> get sports {
    _$sportsAtom.reportRead();
    return super.sports;
  }

  @override
  set sports(ObservableList<Sport> value) {
    _$sportsAtom.reportWrite(value, super.sports, () {
      super.sports = value;
    });
  }

  late final _$fetchSportsAsyncAction =
      AsyncAction('_SportsStore.fetchSports', context: context);

  @override
  Future<void> fetchSports() {
    return _$fetchSportsAsyncAction.run(() => super.fetchSports());
  }

  @override
  String toString() {
    return '''
sports: ${sports}
    ''';
  }
}
