part of 'novel_group_bloc.dart';

class NovelGroupState {
  final List<NovelGroup> novelGroupList;
  final bool isLoading;

  NovelGroupState({
    required this.novelGroupList,
    required this.isLoading,
  });

  NovelGroupState copyWith({
    List<NovelGroup>? novelGroupList,
    bool? isLoading,
  }) {
    return NovelGroupState(
      novelGroupList: novelGroupList ?? this.novelGroupList,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
