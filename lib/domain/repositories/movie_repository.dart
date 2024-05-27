import 'package:my_movie_app/domain/enums/movie_type.dart';

import '../models/models.dart';

abstract class MovieRepository {
  Future<List<Movie>> topTwentyMoviesByFilterType(MovieFilterType type);
  Future<List<Movie>> searchMovies(String query);
  Future<List<MovieVideo>> getMovieVideos(String movieId);
}
