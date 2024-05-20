// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'championships_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChampionshipsStore on _ChampionshipsStore, Store {
  late final _$championshipsAtom =
      Atom(name: '_ChampionshipsStore.championships', context: context);

  @override
  ObservableList<Championship> get championships {
    _$championshipsAtom.reportRead();
    return super.championships;
  }

  @override
  set championships(ObservableList<Championship> value) {
    _$championshipsAtom.reportWrite(value, super.championships, () {
      super.championships = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ChampionshipsStore.isLoading', context: context);

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

  late final _$fetchChampionshipsAsyncAction =
      AsyncAction('_ChampionshipsStore.fetchChampionships', context: context);

  @override
  Future<void> fetchChampionships() {
    return _$fetchChampionshipsAsyncAction
        .run(() => super.fetchChampionships());
  }

  @override
  String toString() {
    return '''
championships: ${championships},
isLoading: ${isLoading}
    ''';
  }
}
