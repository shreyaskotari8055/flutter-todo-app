import 'dart:async';

import '../../../core/domain/usecase/use_case.dart';
import '../../repository/user/user_repository.dart';

class GetUseridUsecase extends UseCase<String?,void> {
  final UserRepository _userRepository;

  GetUseridUsecase(this._userRepository);

  @override
  FutureOr<String?> call({required void params}) async {
   return await _userRepository.getUserId();
  }
}