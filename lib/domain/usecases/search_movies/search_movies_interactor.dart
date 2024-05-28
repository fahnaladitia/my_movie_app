part of 'search_movies.dart';

class SearchMoviesInteractor implements SearchMoviesUsecase {
  final MovieRepository _movieRepository;

  SearchMoviesInteractor(this._movieRepository);

  @override
  Future<MoviePages> execute(SearchMoviesParam param) {
    final query = param.query.isEmpty ? 'a' : param.query;
    return _movieRepository.searchMovies(
      query: query,
      page: param.page,
    );
  }
}
