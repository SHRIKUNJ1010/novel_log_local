import 'package:hive/hive.dart';

@HiveType(typeId: 2)
class NovelGenre extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1, defaultValue: '')
  String tagName;

  @HiveField(2, defaultValue: '')
  String tagDescription;

  NovelGenre({
    required this.id,
    this.tagName = '',
    this.tagDescription = '',
  });
}
