// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sports_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SportsStore on _SportsStore, Store {
  Computed<List<Sport>>? _$filteredSportsComputed;

  @override
  List<Sport> get filteredSports => (_$filteredSportsComputed ??=
          Computed<List<Sport>>(() => super.filteredSports,
              name: '_SportsStore.filteredSports'))
      .value;

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

  late final _$filterAtom = Atom(name: '_SportsStore.filter', context: context);

  @override
  String get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  late final _$fetchSportsAsyncAction =
      AsyncAction('_SportsStore.fetchSports', context: context);

  @override
  Future<void> fetchSports() {
    return _$fetchSportsAsyncAction.run(() => super.fetchSports());
  }

  late final _$_SportsStoreActionController =
      ActionController(name: '_SportsStore', context: context);

  @override
  void setFilter(String value) {
    final _$actionInfo = _$_SportsStoreActionController.startAction(
        name: '_SportsStore.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$_SportsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sports: ${sports},
filter: ${filter},
filteredSports: ${filteredSports}
    ''';
  }
}
