// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$usersAtom = Atom(name: '_HomeControllerBase.users');

  @override
  ObservableList<User> get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(ObservableList<User> value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  final _$resultsFiltersAtom = Atom(name: '_HomeControllerBase.resultsFilters');

  @override
  ObservableList<User> get resultsFilters {
    _$resultsFiltersAtom.reportRead();
    return super.resultsFilters;
  }

  @override
  set resultsFilters(ObservableList<User> value) {
    _$resultsFiltersAtom.reportWrite(value, super.resultsFilters, () {
      super.resultsFilters = value;
    });
  }

  final _$loadingUsersAtom = Atom(name: '_HomeControllerBase.loadingUsers');

  @override
  bool get loadingUsers {
    _$loadingUsersAtom.reportRead();
    return super.loadingUsers;
  }

  @override
  set loadingUsers(bool value) {
    _$loadingUsersAtom.reportWrite(value, super.loadingUsers, () {
      super.loadingUsers = value;
    });
  }

  final _$searchFieldAtom = Atom(name: '_HomeControllerBase.searchField');

  @override
  String get searchField {
    _$searchFieldAtom.reportRead();
    return super.searchField;
  }

  @override
  set searchField(String value) {
    _$searchFieldAtom.reportWrite(value, super.searchField, () {
      super.searchField = value;
    });
  }

  final _$searchModeAtom = Atom(name: '_HomeControllerBase.searchMode');

  @override
  SearchMode get searchMode {
    _$searchModeAtom.reportRead();
    return super.searchMode;
  }

  @override
  set searchMode(SearchMode value) {
    _$searchModeAtom.reportWrite(value, super.searchMode, () {
      super.searchMode = value;
    });
  }

  final _$enabledFiltersAtom = Atom(name: '_HomeControllerBase.enabledFilters');

  @override
  bool get enabledFilters {
    _$enabledFiltersAtom.reportRead();
    return super.enabledFilters;
  }

  @override
  set enabledFilters(bool value) {
    _$enabledFiltersAtom.reportWrite(value, super.enabledFilters, () {
      super.enabledFilters = value;
    });
  }

  final _$genderFilterSelectedAtom =
      Atom(name: '_HomeControllerBase.genderFilterSelected');

  @override
  GenderFilter get genderFilterSelected {
    _$genderFilterSelectedAtom.reportRead();
    return super.genderFilterSelected;
  }

  @override
  set genderFilterSelected(GenderFilter value) {
    _$genderFilterSelectedAtom.reportWrite(value, super.genderFilterSelected,
        () {
      super.genderFilterSelected = value;
    });
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic changeSearchField(String value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.changeSearchField');
    try {
      return super.changeSearchField(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoadingUsers(bool value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setLoadingUsers');
    try {
      return super.setLoadingUsers(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleSearchMode() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.toggleSearchMode');
    try {
      return super.toggleSearchMode();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleGenderFilter() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.toggleGenderFilter');
    try {
      return super.toggleGenderFilter();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleEnabledFilters() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.toggleEnabledFilters');
    try {
      return super.toggleEnabledFilters();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
users: ${users},
resultsFilters: ${resultsFilters},
loadingUsers: ${loadingUsers},
searchField: ${searchField},
searchMode: ${searchMode},
enabledFilters: ${enabledFilters},
genderFilterSelected: ${genderFilterSelected}
    ''';
  }
}
