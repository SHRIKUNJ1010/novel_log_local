part of 'novel_bloc.dart';

abstract class NovelEvent {}

class CreateNovel extends NovelEvent {
  final Novel novelData;

  CreateNovel({required this.novelData});
}

class EditNovel extends NovelEvent {
  final Novel novelData;

  EditNovel({
    required this.novelData,
  });
}

class DeleteNovel extends NovelEvent {
  final String novelId;

  DeleteNovel({
    required this.novelId,
  });
}

class FetchNovels extends NovelEvent {}
