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

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

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
  String toString() {
    return '''
users: ${users},
resultsFilters: ${resultsFilters},
loadingUsers: ${loadingUsers}
    ''';
  }
}
