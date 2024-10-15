import 'package:sembast/sembast.dart';

import '../../../../core/data/local/sembast/sembast_client.dart';
import '../../../../domain/entity/user/user.dart';
import '../../constants/db_constants.dart';

class UserDatasource {
  final SembastClient _sembastClient;
  final StoreRef<String, Map<String, dynamic>> _userStore;

  UserDatasource(this._sembastClient)
      : _userStore =
  stringMapStoreFactory.store(DBConstants.STORE_USER_NAME);

  Future<User?> getUser(String userId) async {
    final record = await _userStore.record(userId).get(_sembastClient.database);
    if (record != null) {
      return User.fromMap(record);
    }
    return null;
  }

  Future<User?> getUserByEmail(String email) async {
    final finder = Finder(filter: Filter.equals('userEmail', email));
    final record = await _userStore.findFirst(_sembastClient.database, finder: finder);
    if (record != null) {
      return User.fromMap(record.value);
    }
    return null;
  }

  Future<User?> addUser(User user) async {
    final response = await _userStore.record(user.userId).put(_sembastClient.database, user.toMap());
    return User.fromMap(response);
  }

  Future<void> updateUser(User user) async {
    final finder = Finder(filter: Filter.byKey(user.userId));
    await _userStore.update(
        _sembastClient.database, user.toMap(),
        finder: finder);
  }

  Future<void> deleteUser(String userId) async {
    await _userStore.record(userId).delete(_sembastClient.database);
  }
}