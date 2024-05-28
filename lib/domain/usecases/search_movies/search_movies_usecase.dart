part of 'search_movies.dart';

abstract class SearchMoviesUsecase extends UseCaseWithParam<MoviePages, SearchMoviesParam> {}

class SearchMoviesParam {
  final String query;
  final int page;

  SearchMoviesParam({
    required this.query,
    required this.page,
  });
}
