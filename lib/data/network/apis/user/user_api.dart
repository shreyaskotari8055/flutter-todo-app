import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../core/data/network/dio/dio_client.dart';
import '../../../../domain/entity/user/user.dart';
import '../../../sharedpref/shared_preference_helper.dart';
import '../../constants/endpoints.dart';

class UserApi {
  final DioClient _dioClient;
  final SharedPreferenceHelper _sharedPreferenceHelper;

  UserApi(this._dioClient,this._sharedPreferenceHelper);

  Future<User?> createUserInDB() async {
    try {
      final token = await _sharedPreferenceHelper.authToken;
      final res = await _dioClient.dio.get(Endpoints.createUser,options: Options(
          headers: {
            "authorization" : "Token ${token}"
          }
      ),);

      log('${res.statusMessage}');

      if (res.statusCode == 201) {
        return User.fromMap(res.data);
      } else {
        return null;
      }

    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}