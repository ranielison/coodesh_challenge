import 'package:coodesh_challenge_f2/app/models/user.dart';
import 'package:coodesh_challenge_f2/app/repositories/user_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

enum SearchMode { Name, Nationality }
enum GenderFilter { Male, Female }

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final _userRepository = GetIt.I.get<UserRepository>();

  int page = 1;

  @observable
  ObservableList<User> users = ObservableList<User>();

  @observable
  ObservableList<User> resultsFilters = ObservableList<User>();

  @observable
  bool loadingUsers = false;

  @observable
  String searchField = '';

  @observable
  SearchMode searchMode = SearchMode.Name;

  @observable
  bool enabledFilters = false;

  @observable
  GenderFilter genderFilterSelected = GenderFilter.Male;

  _HomeControllerBase() {
    loadUsers();
  }

  loadUsers() async {
    setLoadingUsers(true);
    users.addAll(await _userRepository.getUsers(page: page));
    page++;
    setLoadingUsers(false);
  }

  searchUsersByName(String term) {
    List<User> results;

    if (enabledFilters) {
      results = resultsFilters
          .where(
            (user) =>
                user.name!.first!.toLowerCase().startsWith(term.toLowerCase()),
          )
          .toList();
    } else {
      results = users
          .where(
            (user) =>
                user.name!.first!.toLowerCase().startsWith(term.toLowerCase()),
          )
          .toList();
    }

    resultsFilters.clear();
    resultsFilters.addAll(results);
  }

  searchUsersByNationality(String term) {
    List<User> results;

    if (enabledFilters) {
      results = resultsFilters
          .where(
            (user) => user.nat!.startsWith(term.toUpperCase()),
          )
          .toList();
    } else {
      results = users
          .where(
            (user) => user.nat!.startsWith(term.toUpperCase()),
          )
          .toList();
    }

    resultsFilters.clear();
    resultsFilters.addAll(results);
  }

  filterUsersByGender() {
    List<User> results;

    if (genderFilterSelected == GenderFilter.Male) {
      results = users.where((user) => user.gender == 'male').toList();
    } else {
      results = users.where((user) => user.gender == 'female').toList();
    }

    resultsFilters.clear();
    resultsFilters.addAll(results);
  }

  @action
  changeSearchField(String value) {
    searchField = value;
    if (searchField.isEmpty) {
      resultsFilters.clear();

      if (enabledFilters) {
        filterUsersByGender();
      }

      return;
    }

    if (searchMode == SearchMode.Name) {
      searchUsersByName(searchField);
    }

    if (searchMode == SearchMode.Nationality) {
      searchUsersByNationality(searchField);
    }
  }

  @action
  setLoadingUsers(bool value) => this.loadingUsers = value;

  @action
  toggleSearchMode() {
    if (searchMode == SearchMode.Name) {
      searchMode = SearchMode.Nationality;
    } else {
      searchMode = SearchMode.Name;
    }
    changeSearchField(searchField);
  }

  @action
  toggleGenderFilter() {
    if (genderFilterSelected == GenderFilter.Male) {
      genderFilterSelected = GenderFilter.Female;
    } else {
      genderFilterSelected = GenderFilter.Male;
    }

    if (enabledFilters) {
      filterUsersByGender();
    }

    if (searchField.isNotEmpty) {
      if (searchMode == SearchMode.Name) {
        searchUsersByName(searchField);
      } else {
        searchUsersByNationality(searchField);
      }
    }
  }

  @action
  toggleEnabledFilters() {
    enabledFilters = !enabledFilters;

    if (enabledFilters) {
      filterUsersByGender();
    }

    if (searchField.isNotEmpty) {
      if (searchMode == SearchMode.Name) {
        searchUsersByName(searchField);
      } else {
        searchUsersByNationality(searchField);
      }
    }
  }
}
