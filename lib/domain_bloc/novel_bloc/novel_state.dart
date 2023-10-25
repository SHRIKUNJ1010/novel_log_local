part of 'novel_bloc.dart';

class NovelState {
  final List<Novel> novelList;
  final bool isLoading;

  NovelState({
    required this.isLoading,
    required this.novelList,
  });

  NovelState copyWith({
    bool? isLoading,
    List<Novel>? novelList,
  }) {
    return NovelState(
      isLoading: isLoading ?? this.isLoading,
      novelList: novelList ?? this.novelList,
    );
  }
}
