import 'package:coodesh_challenge_f2/app/models/user.dart';
import 'package:coodesh_challenge_f2/app/repositories/user_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final _userRepository = GetIt.I.get<UserRepository>();

  @observable
  ObservableList<User> users = ObservableList<User>();

  @observable
  ObservableList<User> resultsFilters = ObservableList<User>();

  @observable
  bool loadingUsers = false;

  String searchField = '';

  _HomeControllerBase() {
    loadUsers();
  }

  loadUsers() async {
    setLoadingUsers(true);
    users.addAll(await _userRepository.getUsers());
    setLoadingUsers(false);
  }

  searchUsers(String term) {
    List<User> results = users
        .where(
          (user) =>
              user.name!.first!.toLowerCase().startsWith(term.toLowerCase()),
        )
        .toList();

    resultsFilters.clear();
    resultsFilters.addAll(results);
  }

  changeSearchField(String value) {
    searchField = value;
    if (searchField.isNotEmpty) searchUsers(searchField);
  }

  @action
  setLoadingUsers(bool value) => this.loadingUsers = value;
}
