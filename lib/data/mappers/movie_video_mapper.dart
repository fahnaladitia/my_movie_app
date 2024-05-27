import 'package:my_movie_app/data/sources/remote/responses/responses.dart';
import 'package:my_movie_app/domain/models/models.dart';

class MovieVideoMapper {
  MovieVideoMapper._();

  static List<MovieVideo> fromGetMovieVideoListResponseToDomain(GetMovieVideoListResponse response) {
    return response.results?.map((e) {
          return MovieVideo(
            id: e.id?.toString() ?? '',
            key: e.key ?? '',
            name: e.name ?? '',
            site: e.site ?? '',
            type: e.type ?? '',
            size: e.size ?? 0,
          );
        }).toList() ??
        [];
  }
}
