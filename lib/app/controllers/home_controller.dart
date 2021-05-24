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
  bool loadingUsers = false;

  _HomeControllerBase() {
    loadUsers();
  }

  loadUsers() async {
    setLoadingUsers(true);
    users.addAll(await _userRepository.getUsers());
    setLoadingUsers(false);
  }

  @action
  setLoadingUsers(bool value) => this.loadingUsers = value;
}
