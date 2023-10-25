part of 'novel_genre_bloc.dart';

class NovelGenreState {
  final List<NovelGenre> novelGenreList;
  final bool isLoading;

  NovelGenreState({
    required this.isLoading,
    required this.novelGenreList,
  });

  NovelGenreState copyWith({
    bool? isLoading,
    List<NovelGenre>? novelGenreList,
  }) {
    return NovelGenreState(
      isLoading: isLoading ?? this.isLoading,
      novelGenreList: novelGenreList ?? this.novelGenreList,
    );
  }
}
