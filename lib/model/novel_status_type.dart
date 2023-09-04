import 'package:hive/hive.dart';

@HiveType(typeId: 4)
enum NovelStatus {
  @HiveField(0, defaultValue: true)
  production,

  @HiveField(1)
  hiatus,

  @HiveField(2)
  completed,
}
