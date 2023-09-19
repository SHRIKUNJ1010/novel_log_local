import 'package:hive_flutter/hive_flutter.dart';
import 'package:novel_log_local/model/novel_change_log.dart';
import 'package:novel_log_local/utility/constants.dart';

class NovelChangeLogBox {
  final Box<NovelChangeLog> _box = Hive.box(AppConstants.novelChangeLogBoxName);

  //create novel change log
  Future<void> createNovelChangeLog(
      {required NovelChangeLog novelChangeLog}) async {
    _box.add(novelChangeLog);
  }

  //update novel change log
  Future<void> updateNovelChangeLog(
      {required NovelChangeLog novelChangeLog}) async {
    _box.put(novelChangeLog.key, novelChangeLog);
  }

  //get all novel change log list
  Future<List<NovelChangeLog>> getAllNovelChangeLog() async {
    return _box.values.toList();
  }

  //get novel change log by id
  Future<NovelChangeLog?> getNovelChangeLogById(
      {required String novelChangeLogId}) async {
    List<NovelChangeLog> data = _box.values.toList();
    return data.firstWhere((element) => element.id == novelChangeLogId);
  }

  //delete novel change log by id
  Future<void> deleteNovelChangeLog({required String novelChangeLogId}) async {
    List<NovelChangeLog> dataList = _box.values.toList();
    NovelChangeLog tempValue =
        dataList.firstWhere((element) => element.id == novelChangeLogId);
    _box.delete(tempValue.key);
  }
}
