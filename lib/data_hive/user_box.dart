import 'package:hive_flutter/hive_flutter.dart';
import 'package:novel_log_local/model/user_model.dart';
import 'package:novel_log_local/utility/constants.dart';

class UserBox {
  final Box<User> _box = Hive.box<User>(AppConstants.userBoxName);

  //create or update user
  Future<void> createUpdateUser({required User user}) async {
    _box.putAt(0, user);
  }

  Future<User?> getUser() async {
    User? data = _box.getAt(0);
    return data;
  }

  Future<void> deleteUser() async {
    _box.deleteAt(0);
  }
}
