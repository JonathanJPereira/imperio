// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NavigationStore on _NavigationStore, Store {
  Computed<Widget>? _$currentPageComputed;

  @override
  Widget get currentPage =>
      (_$currentPageComputed ??= Computed<Widget>(() => super.currentPage,
              name: '_NavigationStore.currentPage'))
          .value;

  late final _$navItemsAtom =
      Atom(name: '_NavigationStore.navItems', context: context);

  @override
  ObservableList<NavItem> get navItems {
    _$navItemsAtom.reportRead();
    return super.navItems;
  }

  @override
  set navItems(ObservableList<NavItem> value) {
    _$navItemsAtom.reportWrite(value, super.navItems, () {
      super.navItems = value;
    });
  }

  late final _$selectedIndexAtom =
      Atom(name: '_NavigationStore.selectedIndex', context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$menuIsOpenAtom =
      Atom(name: '_NavigationStore.menuIsOpen', context: context);

  @override
  bool get menuIsOpen {
    _$menuIsOpenAtom.reportRead();
    return super.menuIsOpen;
  }

  @override
  set menuIsOpen(bool value) {
    _$menuIsOpenAtom.reportWrite(value, super.menuIsOpen, () {
      super.menuIsOpen = value;
    });
  }

  late final _$_NavigationStoreActionController =
      ActionController(name: '_NavigationStore', context: context);

  @override
  void setIndex(int index) {
    final _$actionInfo = _$_NavigationStoreActionController.startAction(
        name: '_NavigationStore.setIndex');
    try {
      return super.setIndex(index);
    } finally {
      _$_NavigationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleMenu() {
    final _$actionInfo = _$_NavigationStoreActionController.startAction(
        name: '_NavigationStore.toggleMenu');
    try {
      return super.toggleMenu();
    } finally {
      _$_NavigationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
navItems: ${navItems},
selectedIndex: ${selectedIndex},
menuIsOpen: ${menuIsOpen},
currentPage: ${currentPage}
    ''';
  }
}
