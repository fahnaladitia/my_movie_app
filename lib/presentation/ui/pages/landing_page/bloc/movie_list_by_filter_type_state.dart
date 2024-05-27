part of 'movie_list_by_filter_type_bloc.dart';

sealed class MovieListByFilterTypeState extends Equatable {
  const MovieListByFilterTypeState();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

final class MovieListByFilterTypeInitial extends MovieListByFilterTypeState {}

final class MovieListByFilterTypeLoading extends MovieListByFilterTypeState {}

final class MovieListByFilterTypeLoaded extends MovieListByFilterTypeState {
  final List<Movie> movies;

  const MovieListByFilterTypeLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

final class MovieListByFilterTypeError extends MovieListByFilterTypeState {
  final String message;

  const MovieListByFilterTypeError(this.message);

  @override
  List<Object> get props => [message];
}
