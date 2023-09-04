import 'package:hive/hive.dart';

@HiveType(typeId: 3)
enum NovelReadingStatus {
  @HiveField(0)
  notStarted,

  @HiveField(1, defaultValue: true)
  reading,

  @HiveField(2)
  hiatusCompleted,

  @HiveField(3)
  completed,
}
