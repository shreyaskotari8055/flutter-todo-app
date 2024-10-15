import 'dart:async';

import 'package:todo_app/domain/usecase/user/login_usecase.dart';

import '../../entity/user/user.dart';

abstract class UserRepository {
  Future<User?> login(LoginParams parms);

  Future<void> saveIsLoggedIn(bool value);

  Future<bool> get isLoggedIn;

  Future<bool> saveAuth(String token);

  Future<String> getAuthToken();

  Future<void> removeToken();

  Future<String?> getUserId();

  Future<void> saveUserId(String userId);


}
