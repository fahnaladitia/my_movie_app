import 'package:my_movie_app/data/mappers/mappers.dart';
import 'package:my_movie_app/data/sources/remote/services/services.dart';
import 'package:my_movie_app/domain/enums/movie_type.dart';
import 'package:my_movie_app/domain/models/movie.dart';
import 'package:my_movie_app/domain/repositories/repositories.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieService _movieService;

  MovieRepositoryImpl(this._movieService);
  @override
  Future<List<Movie>> topTwentyMoviesByFilterType(MovieFilterType type) async {
    final response = await _movieService.getTopTwentyMoviesByFilterTypeResponse(type);
    return MovieMapper.fromGetMovieListResponseToDomain(response);
  }

  @override
  Future<List<Movie>> searchMovies(String query) async {
    final response = await _movieService.searchMoviesResponse(query);
    return MovieMapper.fromGetMovieListResponseToDomain(response);
  }
}
