import 'dart:async';

import '../../../core/domain/usecase/use_case.dart';
import '../../repository/user/user_repository.dart';

class GetAuthTokenUsecase extends UseCase<String,void> {

  final UserRepository _userRepository;

  GetAuthTokenUsecase(this._userRepository);

  @override
  FutureOr<String> call({required void params}) async {
   return await _userRepository.getAuthToken();
  }

}