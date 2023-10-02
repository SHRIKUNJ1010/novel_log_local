import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:novel_log_local/data_hive/novel_box.dart';
import 'package:novel_log_local/data_hive/novel_change_log_box.dart';
import 'package:novel_log_local/data_hive/novel_genre_box.dart';
import 'package:novel_log_local/data_hive/novel_group_box.dart';
import 'package:novel_log_local/data_hive/user_box.dart';
import 'package:novel_log_local/utility/color.dart';

//Hive Data box//
UserBox userBox = UserBox();
NovelBox novelBox = NovelBox();
NovelGroupBox novelGroupBox = NovelGroupBox();
NovelGenreBox novelGenreBox = NovelGenreBox();
NovelChangeLogBox novelChangeLogBox = NovelChangeLogBox();
//=============//

void main() async {
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Novel Log Local',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: appPrimaryColor),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
