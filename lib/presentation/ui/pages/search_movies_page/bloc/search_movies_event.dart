part of 'search_movies_bloc.dart';

sealed class SearchMoviesEvent extends Equatable {
  const SearchMoviesEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

final class SearchMoviesEventSearch extends SearchMoviesEvent {
  final String query;

  const SearchMoviesEventSearch(this.query);

  @override
  List<Object> get props => [query];
}
