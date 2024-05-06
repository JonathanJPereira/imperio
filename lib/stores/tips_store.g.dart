// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tips_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TipsStore on _TipsStore, Store {
  late final _$tipsAtom = Atom(name: '_TipsStore.tips', context: context);

  @override
  ObservableList<Tip> get tips {
    _$tipsAtom.reportRead();
    return super.tips;
  }

  @override
  set tips(ObservableList<Tip> value) {
    _$tipsAtom.reportWrite(value, super.tips, () {
      super.tips = value;
    });
  }

  late final _$fetchTipsAsyncAction =
      AsyncAction('_TipsStore.fetchTips', context: context);

  @override
  Future<void> fetchTips() {
    return _$fetchTipsAsyncAction.run(() => super.fetchTips());
  }

  @override
  String toString() {
    return '''
tips: ${tips}
    ''';
  }
}
