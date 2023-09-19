import 'package:hive_flutter/hive_flutter.dart';
import 'package:novel_log_local/model/novel_model.dart';
import 'package:novel_log_local/utility/constants.dart';

class NovelBox {
  final Box<Novel> _box = Hive.box(AppConstants.novelBoxName);

  //create novel
  Future<void> createNovel({required Novel novel}) async {
    _box.add(novel);
  }

  //update novel
  Future<void> updateNovel({required Novel novel}) async {
    _box.put(novel.key, novel);
  }

  //get all novel list
  Future<List<Novel>> getAllNovels() async {
    return _box.values.toList();
  }

  //get novel by id
  Future<Novel?> getNovelById({required String novelId}) async {
    List<Novel> data = _box.values.toList();
    return data.firstWhere((element) => element.id == novelId);
  }

  //delete novel by id
  Future<void> deleteNovel({required String novelId}) async {
    List<Novel> dataList = _box.values.toList();
    Novel tempValue = dataList.firstWhere((element) => element.id == novelId);
    _box.delete(tempValue.key);
  }
}
