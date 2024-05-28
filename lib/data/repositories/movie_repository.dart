import 'package:my_movie_app/data/mappers/mappers.dart';
import 'package:my_movie_app/data/sources/remote/services/services.dart';
import 'package:my_movie_app/domain/enums/movie_type.dart';
import 'package:my_movie_app/domain/models/models.dart';
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
  Future<MoviePages> searchMovies({required String query, required int page}) async {
    final response = await _movieService.searchMoviesResponse(query: query, page: page);
    return MovieMapper.fromGetMovieListResponseToDomainPages(response);
  }

  @override
  Future<List<MovieVideo>> getMovieVideos(String movieId) async {
    final response = await _movieService.getMovieVideoListResponse(movieId);
    return MovieVideoMapper.fromGetMovieVideoListResponseToDomain(response);
  }
}
