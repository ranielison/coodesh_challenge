import 'package:dio/dio.dart';

import 'package:coodesh_challenge_f2/app/models/user.dart';

class UserProvider {
  Dio dio;

  UserProvider({
    required this.dio,
  });

  Future<List<User>> getUsers({int page = 1}) async {
    final response = await dio.get(
      'https://randomuser.me/api/?results=50&page=$page',
    );

    if (response.statusCode == 200) {
      return (response.data['results'] as List)
          .map((item) => User.fromJson(item))
          .toList();
    }

    return [];
  }
}
