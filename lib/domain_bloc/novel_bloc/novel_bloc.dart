import 'package:bloc/bloc.dart';
import 'package:novel_log_local/main.dart';
import 'package:novel_log_local/model/novel_model.dart';

part 'novel_event.dart';

part 'novel_state.dart';

class NovelBloc extends Bloc<NovelEvent, NovelState> {
  NovelBloc() : super(NovelState(isLoading: false, novelList: [])) {
    on<CreateNovel>(_onCreateNovel);
    on<EditNovel>(_onEditNovel);
    on<DeleteNovel>(_onDeleteNovel);
    on<FetchNovels>(_onFetchNovels);
  }

  Future<void> _onCreateNovel(
    CreateNovel event,
    Emitter<NovelState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    await novelBox.createNovel(novel: event.novelData);
    List<Novel> tempList = await novelBox.getAllNovels();
    emit(state.copyWith(
      novelList: tempList,
      isLoading: false,
    ));
  }

  Future<void> _onEditNovel(
    EditNovel event,
    Emitter<NovelState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    await novelBox.updateNovel(novel: event.novelData);
    List<Novel> tempList = await novelBox.getAllNovels();
    emit(state.copyWith(
      novelList: tempList,
      isLoading: false,
    ));
  }

  Future<void> _onDeleteNovel(
    DeleteNovel event,
    Emitter<NovelState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    await novelBox.deleteNovel(novelId: event.novelId);
    List<Novel> tempList = await novelBox.getAllNovels();
    emit(state.copyWith(
      novelList: tempList,
      isLoading: false,
    ));
  }

  Future<void> _onFetchNovels(
    FetchNovels event,
    Emitter<NovelState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    List<Novel> tempList = await novelBox.getAllNovels();
    emit(state.copyWith(
      novelList: tempList,
      isLoading: false,
    ));
  }
}
