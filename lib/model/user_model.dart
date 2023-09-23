import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1, defaultValue: false)
  bool isBiometricOn;

  User({
    required this.id,
    this.isBiometricOn = false,
  });
}
