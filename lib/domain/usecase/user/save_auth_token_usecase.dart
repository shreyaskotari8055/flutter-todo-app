import 'dart:async';

import '../../../core/domain/usecase/use_case.dart';
import '../../repository/user/user_repository.dart';

class SaveAuthTokenUsecase extends UseCase<bool,String> {

  final UserRepository _userRepository;

  SaveAuthTokenUsecase(this._userRepository);

  @override
  FutureOr<bool> call({required String params}) async {
    return await _userRepository.saveAuth(params);
  }

}