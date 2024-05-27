import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_movie_app/core/common/exceptions/base_exception.dart';
import 'package:my_movie_app/domain/enums/movie_type.dart';
import 'package:my_movie_app/domain/models/models.dart';
import 'package:my_movie_app/domain/usecases/usecases.dart';

part 'movie_list_by_filter_type_event.dart';
part 'movie_list_by_filter_type_state.dart';

class MovieListByFilterTypeBloc extends Bloc<MovieListByFilterTypeEvent, MovieListByFilterTypeState> {
  final MovieListByFilterTypeUsecase _movieListByFilterTypeUsecase;
  MovieListByFilterTypeBloc(this._movieListByFilterTypeUsecase) : super(MovieListByFilterTypeInitial()) {
    on<FetchMovieListByFilterTypeEvent>((event, emit) async {
      emit(MovieListByFilterTypeLoading());
      try {
        final movies = await _movieListByFilterTypeUsecase.execute(event.filterType);
        emit(MovieListByFilterTypeLoaded(movies));
      } on BaseException catch (e) {
        emit(MovieListByFilterTypeError(e.message));
      } catch (e) {
        emit(MovieListByFilterTypeError(e.toString()));
      }
    });
  }
}
