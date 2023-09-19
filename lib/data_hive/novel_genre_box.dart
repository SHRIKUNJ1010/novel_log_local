import 'package:hive_flutter/hive_flutter.dart';
import 'package:novel_log_local/model/novel_genre_model.dart';
import 'package:novel_log_local/utility/constants.dart';

class NovelGenreBox {
  final Box<NovelGenre> _box = Hive.box(AppConstants.novelGenreBoxName);

  //create novel genre
  Future<void> createNovelGenre({required NovelGenre novelGenre}) async {
    _box.add(novelGenre);
  }

  //update novel genre
  Future<void> updateNovelGenre({required NovelGenre novelGenre}) async {
    _box.put(novelGenre.key, novelGenre);
  }

  //get all novel genre list
  Future<List<NovelGenre>> getAllNovelGenres() async {
    return _box.values.toList();
  }

  //get novel genre by id
  Future<NovelGenre?> getNovelGenreById({required String novelGenreId}) async {
    List<NovelGenre> data = _box.values.toList();
    return data.firstWhere((element) => element.id == novelGenreId);
  }

  //delete novel genre by id
  Future<void> deleteNovelGenre({required String novelGenreId}) async {
    List<NovelGenre> dataList = _box.values.toList();
    NovelGenre tempValue =
        dataList.firstWhere((element) => element.id == novelGenreId);
    _box.delete(tempValue.key);
  }
}
