// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NavigationStore on _NavigationStore, Store {
  Computed<List<NavItem>>? _$filteredItemsComputed;

  @override
  List<NavItem> get filteredItems => (_$filteredItemsComputed ??=
          Computed<List<NavItem>>(() => super.filteredItems,
              name: '_NavigationStore.filteredItems'))
      .value;
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

  late final _$_searchTextAtom =
      Atom(name: '_NavigationStore._searchText', context: context);

  @override
  String get _searchText {
    _$_searchTextAtom.reportRead();
    return super._searchText;
  }

  @override
  set _searchText(String value) {
    _$_searchTextAtom.reportWrite(value, super._searchText, () {
      super._searchText = value;
    });
  }

  late final _$selectedItemIdAtom =
      Atom(name: '_NavigationStore.selectedItemId', context: context);

  @override
  String get selectedItemId {
    _$selectedItemIdAtom.reportRead();
    return super.selectedItemId;
  }

  @override
  set selectedItemId(String value) {
    _$selectedItemIdAtom.reportWrite(value, super.selectedItemId, () {
      super.selectedItemId = value;
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

  late final _$isSearchOpenAtom =
      Atom(name: '_NavigationStore.isSearchOpen', context: context);

  @override
  bool get isSearchOpen {
    _$isSearchOpenAtom.reportRead();
    return super.isSearchOpen;
  }

  @override
  set isSearchOpen(bool value) {
    _$isSearchOpenAtom.reportWrite(value, super.isSearchOpen, () {
      super.isSearchOpen = value;
    });
  }

  late final _$_NavigationStoreActionController =
      ActionController(name: '_NavigationStore', context: context);

  @override
  void setSelectedItem(String id) {
    final _$actionInfo = _$_NavigationStoreActionController.startAction(
        name: '_NavigationStore.setSelectedItem');
    try {
      return super.setSelectedItem(id);
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
  void toggleSearch() {
    final _$actionInfo = _$_NavigationStoreActionController.startAction(
        name: '_NavigationStore.toggleSearch');
    try {
      return super.toggleSearch();
    } finally {
      _$_NavigationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchText(String text) {
    final _$actionInfo = _$_NavigationStoreActionController.startAction(
        name: '_NavigationStore.setSearchText');
    try {
      return super.setSearchText(text);
    } finally {
      _$_NavigationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearSearch() {
    final _$actionInfo = _$_NavigationStoreActionController.startAction(
        name: '_NavigationStore.clearSearch');
    try {
      return super.clearSearch();
    } finally {
      _$_NavigationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
navItems: ${navItems},
selectedItemId: ${selectedItemId},
menuIsOpen: ${menuIsOpen},
isSearchOpen: ${isSearchOpen},
filteredItems: ${filteredItems},
currentPage: ${currentPage}
    ''';
  }
}
