import 'package:bloc/bloc.dart';
import 'package:novel_log_local/main.dart';
import 'package:novel_log_local/model/novel_genre_model.dart';

part 'novel_genre_event.dart';

part 'novel_genre_state.dart';

class NovelGenreBloc extends Bloc<NovelGenreEvent, NovelGenreState> {
  NovelGenreBloc()
      : super(NovelGenreState(isLoading: false, novelGenreList: [])) {
    on<CreateNovelGenre>(_onCreateNovelGenre);
    on<EditNovelGenre>(_onEditNovelGenre);
    on<DeleteNovelGenre>(_onDeleteNovelGenre);
    on<FetchNovelGenres>(_onFetchNovelGenres);
  }

  Future<void> _onCreateNovelGenre(
    CreateNovelGenre event,
    Emitter<NovelGenreState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    await novelGenreBox.createNovelGenre(novelGenre: event.novelGenreData);
    List<NovelGenre> tempList = await novelGenreBox.getAllNovelGenres();
    emit(state.copyWith(
      novelGenreList: tempList,
      isLoading: false,
    ));
  }

  Future<void> _onEditNovelGenre(
    EditNovelGenre event,
    Emitter<NovelGenreState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    await novelGenreBox.updateNovelGenre(novelGenre: event.novelGenreData);
    List<NovelGenre> tempList = await novelGenreBox.getAllNovelGenres();
    emit(state.copyWith(
      novelGenreList: tempList,
      isLoading: false,
    ));
  }

  Future<void> _onDeleteNovelGenre(
    DeleteNovelGenre event,
    Emitter<NovelGenreState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    await novelGenreBox.deleteNovelGenre(novelGenreId: event.novelGenreId);
    List<NovelGenre> tempList = await novelGenreBox.getAllNovelGenres();
    emit(state.copyWith(
      novelGenreList: tempList,
      isLoading: false,
    ));
  }

  Future<void> _onFetchNovelGenres(
    FetchNovelGenres event,
    Emitter<NovelGenreState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    List<NovelGenre> tempList = await novelGenreBox.getAllNovelGenres();
    emit(state.copyWith(
      novelGenreList: tempList,
      isLoading: false,
    ));
  }
}
