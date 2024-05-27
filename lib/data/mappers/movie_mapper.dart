import 'package:my_movie_app/data/sources/remote/responses/responses.dart';
import 'package:my_movie_app/domain/models/models.dart';

class MovieMapper {
  MovieMapper._();

  static List<Movie> fromGetMovieListResponseToDomain(GetMovieListResponse response) {
    return response.results?.map((e) {
          return Movie(
            id: e.id?.toString() ?? '',
            description: e.overview ?? '',
            title: e.title ?? '',
            posterPath: e.posterPath ?? '',
          );
        }).toList() ??
        [];
  }
}
