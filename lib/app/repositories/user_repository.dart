import 'package:coodesh_challenge_f2/app/models/user.dart';
import 'package:coodesh_challenge_f2/app/providers/user_provider.dart';

class UserRepository {
  final UserProvider provider;

  UserRepository(this.provider);

  Future<List<User>> getUsers({int page = 1}) async {
    return provider.getUsers(page: page);
  }
}
