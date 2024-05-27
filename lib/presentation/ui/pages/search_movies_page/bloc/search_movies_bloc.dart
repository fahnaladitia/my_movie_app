import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:my_movie_app/domain/usecases/usecases.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:equatable/equatable.dart';
import 'package:my_movie_app/core/common/exceptions/base_exception.dart';
import 'package:my_movie_app/domain/models/models.dart';

part 'search_movies_event.dart';
part 'search_movies_state.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  final SearchMoviesUsecase _searchMoviesUsecase;
  SearchMoviesBloc(this._searchMoviesUsecase) : super(SearchMoviesInitial()) {
    on<SearchMoviesEventSearch>((event, emit) async {
      emit(SearchMoviesLoading());
      try {
        final movies = await _searchMoviesUsecase.execute(event.query);

        if (movies.isEmpty) {
          emit(SearchMoviesEmpty());
          return;
        }
        emit(SearchMoviesLoaded(movies));
      } on BaseException catch (e) {
        emit(SearchMoviesError(e.message));
      } catch (e) {
        emit(SearchMoviesError(e.toString()));
      }
    }, transformer: (events, mapper) {
      return restartable<SearchMoviesEventSearch>().call(events.debounce(const Duration(milliseconds: 500)), mapper);
    });
  }
}
