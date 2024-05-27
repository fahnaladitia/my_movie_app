part of 'movie_list_by_filter_type.dart';

class MovieListByFilterTypeInteractor implements MovieListByFilterTypeUsecase {
  final MovieRepository _movieRepository;

  MovieListByFilterTypeInteractor(this._movieRepository);

  @override
  Future<List<Movie>> execute(MovieFilterType param) => _movieRepository.topTwentyMoviesByFilterType(param);
}
