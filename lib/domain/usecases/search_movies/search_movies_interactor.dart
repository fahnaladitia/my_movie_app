part of 'search_movies.dart';

class SearchMoviesInteractor implements SearchMoviesUsecase {
  final MovieRepository _movieRepository;

  SearchMoviesInteractor(this._movieRepository);

  @override
  Future<List<Movie>> execute(String param) {
    final query = param.isEmpty ? 'a' : param;
    return _movieRepository.searchMovies(query);
  }
}
