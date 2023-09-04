import 'package:hive/hive.dart';
import 'package:novel_log_local/model/novel_genre_model.dart';
import 'package:novel_log_local/model/novel_group_model.dart';
import 'package:novel_log_local/model/novel_reading_status_type.dart';
import 'package:novel_log_local/model/novel_status_type.dart';

@HiveType(typeId: 1)
class Novel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1, defaultValue: '')
  String novelName;

  @HiveField(2, defaultValue: '')
  String novelLinkUrl;

  @HiveField(3, defaultValue: 0)
  int readChapterCount;

  @HiveField(4, defaultValue: 0)
  int totalChapterCount;

  @HiveField(5, defaultValue: '')
  String authorName;

  @HiveField(6, defaultValue: false)
  bool isManga;

  @HiveField(7, defaultValue: NovelReadingStatus.reading)
  NovelReadingStatus novelReadingStatus;

  @HiveField(8, defaultValue: NovelStatus.production)
  NovelStatus novelStatus;

  @HiveField(9)
  HiveList<NovelGenre>? novelGenres;

  @HiveField(10)
  NovelGroup? novelGroup;

  Novel({
    required this.id,
    this.novelName = '',
    this.novelLinkUrl = '',
    this.readChapterCount = 0,
    this.totalChapterCount = 0,
    this.authorName = '',
    this.isManga = false,
    this.novelReadingStatus = NovelReadingStatus.reading,
    this.novelStatus = NovelStatus.production,
    this.novelGenres,
    this.novelGroup,
  });
}
