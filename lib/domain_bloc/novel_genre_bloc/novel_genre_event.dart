part of 'novel_genre_bloc.dart';

abstract class NovelGenreEvent {}

class CreateNovelGenre extends NovelGenreEvent {
  final NovelGenre novelGenreData;

  CreateNovelGenre({
    required this.novelGenreData,
  });
}

class EditNovelGenre extends NovelGenreEvent {
  final NovelGenre novelGenreData;

  EditNovelGenre({
    required this.novelGenreData,
  });
}

class DeleteNovelGenre extends NovelGenreEvent {
  final String novelGenreId;

  DeleteNovelGenre({
    required this.novelGenreId,
  });
}

class FetchNovelGenres extends NovelGenreEvent {}
