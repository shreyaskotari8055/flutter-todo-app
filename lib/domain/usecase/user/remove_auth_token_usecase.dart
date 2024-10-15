import 'dart:async';

import '../../../core/domain/usecase/use_case.dart';
import '../../repository/user/user_repository.dart';

class RemoveAuthTokenUsecase extends UseCase<void,void> {

  final UserRepository _userRepository;

  RemoveAuthTokenUsecase(this._userRepository);

  @override
  FutureOr<void> call({required void params}) {
    _userRepository.removeToken();
  }

}