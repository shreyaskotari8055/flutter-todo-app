import 'dart:async';
import 'dart:developer';

import '../../../domain/entity/user/user.dart';
import '../../../domain/repository/user/user_repository.dart';
import '../../../domain/usecase/user/login_usecase.dart';
import '../../../network/network.dart';
import '../../local/datasources/user/user_datasource.dart';
import '../../network/apis/user/user_api.dart';
import '../../sharedpref/shared_preference_helper.dart';

class UserRepositoryImpl extends UserRepository {
  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;
  final UserDatasource _userDatasource;
  final NetworkInfo _networkInfo;
  final UserApi _userApi;

  // constructor
  UserRepositoryImpl(this._sharedPrefsHelper,this._userDatasource,this._networkInfo,this._userApi);

  // Login:---------------------------------------------------------------------
  @override
  Future<User?> login(LoginParams params) async {
    bool hasInternet = await _networkInfo.hasInternet();

    if (hasInternet) {
      try {
        var res = await _userApi.createUserInDB();
        if (res != null) {
          await _userDatasource.addUser(res);
          return res;
        }
      } catch (e) {
        log(e.toString());
      }
    }
    return null;
  }

  @override
  Future<void> saveIsLoggedIn(bool value) =>
      _sharedPrefsHelper.saveIsLoggedIn(value);

  @override
  Future<bool> get isLoggedIn => _sharedPrefsHelper.isLoggedIn;

  @override
  Future<String> getAuthToken() async {
    return await _sharedPrefsHelper.authToken ?? '';
  }

  @override
  Future<void> removeToken() async {
    _sharedPrefsHelper.removeAuthToken();
  }

  @override
  Future<bool> saveAuth(String token) async {
    return await _sharedPrefsHelper.saveAuthToken(token);
  }

  @override
  Future<String?> getUserId() async {
    return await _sharedPrefsHelper.userId;
  }

  @override
  Future<void> saveUserId(String userId) async {
    await _sharedPrefsHelper.saveUserId(userId);
  }
}
