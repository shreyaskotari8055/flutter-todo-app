import 'dart:async';


import '../../../di/service_locator.dart';
import '../../repository/post/post_repository.dart';
import '../../repository/user/user_repository.dart';
import '../../usecase/post/delete_post_usecase.dart';
import '../../usecase/post/find_post_by_id_usecase.dart';
import '../../usecase/post/get_post_usecase.dart';
import '../../usecase/post/insert_post_usecase.dart';
import '../../usecase/post/udpate_post_usecase.dart';
import '../../usecase/user/get_auth_token_usecase.dart';
import '../../usecase/user/get_userId_usecase.dart';
import '../../usecase/user/is_logged_in_usecase.dart';
import '../../usecase/user/login_usecase.dart';
import '../../usecase/user/remove_auth_token_usecase.dart';
import '../../usecase/user/save_auth_token_usecase.dart';
import '../../usecase/user/save_login_in_status_usecase.dart';
import '../../usecase/user/save_userId_usecase.dart';

class UseCaseModule {
  static Future<void> configureUseCaseModuleInjection() async {
    // user:--------------------------------------------------------------------
    getIt.registerSingleton<IsLoggedInUseCase>(
      IsLoggedInUseCase(getIt<UserRepository>()),
    );
    getIt.registerSingleton<SaveLoginStatusUseCase>(
      SaveLoginStatusUseCase(getIt<UserRepository>()),
    );
    getIt.registerSingleton<LoginUseCase>(
      LoginUseCase(getIt<UserRepository>()),
    );
    getIt.registerSingleton<GetAuthTokenUsecase>(
      GetAuthTokenUsecase(getIt<UserRepository>()),
    );
    getIt.registerSingleton<RemoveAuthTokenUsecase>(
      RemoveAuthTokenUsecase(getIt<UserRepository>()),
    );
    getIt.registerSingleton<SaveAuthTokenUsecase>(
      SaveAuthTokenUsecase(getIt<UserRepository>()),
    );
    getIt.registerSingleton<GetUseridUsecase>(
      GetUseridUsecase(getIt<UserRepository>()),
    );
    getIt.registerSingleton<SaveUseridUsecase>(
      SaveUseridUsecase(getIt<UserRepository>()),
    );

    // post:--------------------------------------------------------------------
    getIt.registerSingleton<GetPostUseCase>(
      GetPostUseCase(getIt<PostRepository>()),
    );
    getIt.registerSingleton<FindPostByIdUseCase>(
      FindPostByIdUseCase(getIt<PostRepository>()),
    );
    getIt.registerSingleton<InsertPostUseCase>(
      InsertPostUseCase(getIt<PostRepository>()),
    );
    getIt.registerSingleton<UpdatePostUseCase>(
      UpdatePostUseCase(getIt<PostRepository>()),
    );
    getIt.registerSingleton<DeletePostUseCase>(
      DeletePostUseCase(getIt<PostRepository>()),
    );
  }
}
