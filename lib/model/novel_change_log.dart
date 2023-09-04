import 'package:hive/hive.dart';
import 'package:novel_log_local/model/novel_model.dart';

@HiveType(typeId: 7)
class NovelChangeLog extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  Novel changedNovel;

  @HiveField(2)
  DateTime logDateTime;

  @HiveField(3)
  int logNovelChapter;

  NovelChangeLog({
    required this.id,
    required this.changedNovel,
    required this.logNovelChapter,
    required this.logDateTime,
  });
}
