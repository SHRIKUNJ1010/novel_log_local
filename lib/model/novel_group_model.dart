import 'package:hive/hive.dart';

@HiveType(typeId: 5)
class NovelGroup extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1, defaultValue: '')
  String novelGroupName;

  @HiveField(2, defaultValue: '')
  String novelGroupDescription;

  NovelGroup({
    required this.id,
    this.novelGroupName = '',
    this.novelGroupDescription = '',
  });
}
