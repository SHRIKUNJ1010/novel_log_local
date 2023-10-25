part of 'novel_group_bloc.dart';

abstract class NovelGroupEvent {}

class CreateNovelGroup extends NovelGroupEvent {
  final NovelGroup novelGroupData;

  CreateNovelGroup({
    required this.novelGroupData,
  });
}

class EditNovelGroup extends NovelGroupEvent {
  final NovelGroup novelGroupData;

  EditNovelGroup({
    required this.novelGroupData,
  });
}

class DeleteNovelGroup extends NovelGroupEvent {
  final String novelGroupId;

  DeleteNovelGroup({
    required this.novelGroupId,
  });
}

class FetchNovelGroups extends NovelGroupEvent {}
