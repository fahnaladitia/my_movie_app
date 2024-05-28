part of 'search_movies_bloc.dart';

sealed class SearchMoviesState extends Equatable {
  const SearchMoviesState();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

final class SearchMoviesInitial extends SearchMoviesState {}

final class SearchMoviesLoading extends SearchMoviesState {}

final class SearchMoviesLoaded extends SearchMoviesState {
  final List<Movie> movies;

  const SearchMoviesLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

final class SearchMoviesEmpty extends SearchMoviesState {}

final class SearchMoviesError extends SearchMoviesState {
  final String message;

  const SearchMoviesError(this.message);

  @override
  List<Object> get props => [message];
}

final class SearchMoviesLoadingMore extends SearchMoviesState {
  final List<Movie> movies;

  const SearchMoviesLoadingMore(this.movies);

  @override
  List<Object> get props => [movies];
}

final class SearchMoviesLoadedMore extends SearchMoviesState {
  final List<Movie> movies;

  const SearchMoviesLoadedMore(this.movies);

  @override
  List<Object> get props => [movies];
}

final class SearchMoviesErrorMore extends SearchMoviesState {
  final List<Movie> movies;
  final String message;

  const SearchMoviesErrorMore(this.movies, this.message);

  @override
  List<Object> get props => [movies, message];
}
