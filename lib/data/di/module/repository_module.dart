import 'dart:async';


import 'package:todo_app/data/local/datasources/user/user_datasource.dart';
import 'package:todo_app/data/network/apis/user/user_api.dart';
import 'package:todo_app/network/network.dart';

import '../../../di/service_locator.dart';
import '../../../domain/repository/post/post_repository.dart';
import '../../../domain/repository/setting/setting_repository.dart';
import '../../../domain/repository/user/user_repository.dart';
import '../../local/datasources/post/post_datasource.dart';
import '../../network/apis/posts/post_api.dart';
import '../../repository/post/post_repository_impl.dart';
import '../../repository/setting/setting_repository_impl.dart';
import '../../repository/user/user_repository_impl.dart';
import '../../sharedpref/shared_preference_helper.dart';

class RepositoryModule {
  static Future<void> configureRepositoryModuleInjection() async {
    // repository:--------------------------------------------------------------
    getIt.registerSingleton<SettingRepository>(SettingRepositoryImpl(
      getIt<SharedPreferenceHelper>(),
    ));

    getIt.registerSingleton<UserRepository>(UserRepositoryImpl(
      getIt<SharedPreferenceHelper>(),
      getIt<UserDatasource>(),
      getIt<NetworkInfoImpl>(),
      getIt<UserApi>()
    ));

    getIt.registerSingleton<PostRepository>(PostRepositoryImpl(
      getIt<PostApi>(),
      getIt<PostDataSource>(),
    ));

  }
}
