import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1, defaultValue: '')
  String userPin;

  @HiveField(2, defaultValue: '')
  String userMasterPassword;

  User({
    required this.id,
    this.userPin = '',
    this.userMasterPassword = '',
  });
}
