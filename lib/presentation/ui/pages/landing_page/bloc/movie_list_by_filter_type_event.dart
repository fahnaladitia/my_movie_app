part of 'movie_list_by_filter_type_bloc.dart';

sealed class MovieListByFilterTypeEvent extends Equatable {
  const MovieListByFilterTypeEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

final class FetchMovieListByFilterTypeEvent extends MovieListByFilterTypeEvent {
  final MovieFilterType filterType;

  const FetchMovieListByFilterTypeEvent(this.filterType);

  @override
  List<Object> get props => [filterType];
}
