import 'dart:async';

import '../../../core/domain/usecase/use_case.dart';
import '../../repository/user/user_repository.dart';

class SaveUseridUsecase extends UseCase<void,String> {

  final UserRepository _userRepository;

  SaveUseridUsecase(this._userRepository);

  @override
  FutureOr<void> call({required String params}) async {
    await _userRepository.saveUserId(params);
  }

}