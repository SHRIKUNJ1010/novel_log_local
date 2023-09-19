import 'package:hive_flutter/hive_flutter.dart';
import 'package:novel_log_local/model/novel_group_model.dart';
import 'package:novel_log_local/utility/constants.dart';

class NovelGroupBox {
  final Box<NovelGroup> _box = Hive.box(AppConstants.novelGroupBoxName);

  //create novel group
  Future<void> createNovelGroup({required NovelGroup novelGroup}) async {
    _box.add(novelGroup);
  }

  //update novel group
  Future<void> updateNovelGroup({required NovelGroup novelGroup}) async {
    _box.put(novelGroup.key, novelGroup);
  }

  //get all novel group list
  Future<List<NovelGroup>> getAllNovelGroups() async {
    return _box.values.toList();
  }

  //get novel group by id
  Future<NovelGroup?> getNovelGroupById({required String novelGroupId}) async {
    List<NovelGroup> data = _box.values.toList();
    return data.firstWhere((element) => element.id == novelGroupId);
  }

  //delete novel group by id
  Future<void> deleteNovelGroup({required String novelGroupId}) async {
    List<NovelGroup> dataList = _box.values.toList();
    NovelGroup tempValue =
        dataList.firstWhere((element) => element.id == novelGroupId);
    _box.delete(tempValue.key);
  }
}
