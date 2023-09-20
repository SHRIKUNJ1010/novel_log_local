import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1, defaultValue: '')
  String userPin;

  @HiveField(2, defaultValue: '')
  String userMasterPassword;

  @HiveField(3, defaultValue: false)
  bool isBiometricOn;

  User({
    required this.id,
    this.userPin = '',
    this.userMasterPassword = '',
    this.isBiometricOn = false,
  });
}
