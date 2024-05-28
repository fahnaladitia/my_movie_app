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

  // Pagination
  bool _hasReachedMax = false;
  int _currentPage = 0;
  List<Movie> _currentMovies = [];
  String _currentQuery = '';

  SearchMoviesBloc(this._searchMoviesUsecase) : super(SearchMoviesInitial()) {
    on<SearchMoviesEventSearch>((event, emit) async {
      emit(SearchMoviesLoading());
      try {
        _currentPage = 1;
        _currentQuery = event.query;
        final pages = await _searchMoviesUsecase.execute(SearchMoviesParam(query: _currentQuery, page: _currentPage));
        _hasReachedMax = pages.page == pages.totalPages;
        _currentMovies = pages.movies;

        emit(SearchMoviesLoaded(_currentMovies));
      } on BaseException catch (e) {
        emit(SearchMoviesError(e.message));
      } catch (e) {
        emit(SearchMoviesError(e.toString()));
      }
    }, transformer: (events, mapper) {
      return restartable<SearchMoviesEventSearch>().call(events.debounce(const Duration(milliseconds: 500)), mapper);
    });
    on<SearchMoviesEventLoadMore>((event, emit) async {
      if (_hasReachedMax) return;

      if (_currentMovies.isEmpty) {
        emit(SearchMoviesLoading());
      } else {
        emit(SearchMoviesLoadingMore(_currentMovies));
      }
      try {
        final pages = await _searchMoviesUsecase.execute(SearchMoviesParam(
          query: _currentQuery,
          page: _currentPage + 1,
        ));
        _hasReachedMax = pages.page == pages.totalPages;
        _currentPage = pages.page;
        _currentMovies = [..._currentMovies, ...pages.movies];

        emit(SearchMoviesLoadedMore(_currentMovies));
      } on BaseException catch (e) {
        if (_currentMovies.isEmpty) {
          emit(SearchMoviesError(e.message));
        } else {
          emit(SearchMoviesErrorMore(_currentMovies, e.message));
        }
      } catch (e) {
        if (_currentMovies.isEmpty) {
          emit(SearchMoviesError(e.toString()));
        } else {
          emit(SearchMoviesErrorMore(_currentMovies, e.toString()));
        }
      }
    }, transformer: (events, mapper) {
      return droppable<SearchMoviesEventLoadMore>().call(events.debounce(const Duration(milliseconds: 500)), mapper);
    });
  }
}
