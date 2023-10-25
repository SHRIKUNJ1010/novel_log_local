import 'package:bloc/bloc.dart';
import 'package:novel_log_local/main.dart';
import 'package:novel_log_local/model/novel_group_model.dart';

part 'novel_group_event.dart';

part 'novel_group_state.dart';

class NovelGroupBloc extends Bloc<NovelGroupEvent, NovelGroupState> {
  NovelGroupBloc()
      : super(NovelGroupState(novelGroupList: [], isLoading: false)) {
    on<CreateNovelGroup>(_onCreateNovelGroup);
    on<EditNovelGroup>(_onEditNovelGroup);
    on<DeleteNovelGroup>(_onDeleteNovelGroup);
    on<FetchNovelGroups>(_onFetchNovelGroups);
  }

  Future<void> _onCreateNovelGroup(
    CreateNovelGroup event,
    Emitter<NovelGroupState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    await novelGroupBox.createNovelGroup(novelGroup: event.novelGroupData);
    List<NovelGroup> tempList = await novelGroupBox.getAllNovelGroups();
    emit(state.copyWith(
      novelGroupList: tempList,
      isLoading: false,
    ));
  }

  Future<void> _onEditNovelGroup(
    EditNovelGroup event,
    Emitter<NovelGroupState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    await novelGroupBox.updateNovelGroup(novelGroup: event.novelGroupData);
    List<NovelGroup> tempList = await novelGroupBox.getAllNovelGroups();
    emit(state.copyWith(
      novelGroupList: tempList,
      isLoading: false,
    ));
  }

  Future<void> _onDeleteNovelGroup(
    DeleteNovelGroup event,
    Emitter<NovelGroupState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    await novelGroupBox.deleteNovelGroup(novelGroupId: event.novelGroupId);
    List<NovelGroup> tempList = await novelGroupBox.getAllNovelGroups();
    emit(state.copyWith(
      novelGroupList: tempList,
      isLoading: false,
    ));
  }

  Future<void> _onFetchNovelGroups(
    FetchNovelGroups event,
    Emitter<NovelGroupState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    List<NovelGroup> tempList = await novelGroupBox.getAllNovelGroups();
    emit(state.copyWith(
      novelGroupList: tempList,
      isLoading: false,
    ));
  }
}
