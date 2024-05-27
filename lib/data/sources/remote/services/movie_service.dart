import 'package:dio/dio.dart';
import 'package:my_movie_app/core/common/constants/app_constants.dart';
import 'package:my_movie_app/core/config/config.dart';
import 'package:my_movie_app/domain/enums/movie_type.dart';

import '../responses/responses.dart';

class MovieService extends BaseService {
  MovieService(super.dio);

  Map<String, String> _headers(String token) => {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

  Future<GetMovieListResponse> getTopTwentyMoviesByFilterTypeResponse(MovieFilterType type) async {
    try {
      final response = await dio.get(
        '/movie/${type.toJsonType}',
        options: applyOptions(headers: _headers(AppConstants.movieDBApiToken)),
      );

      return GetMovieListResponse.fromMap(response.data);
    } on DioException catch (e) {
      throw exceptionHandler(
        e,
        onBadResponse: (data) {
          final errorResponse = TheMovieDbErrorResponse.fromMap(data);
          return errorResponse.statusMessage;
        },
      );
    }
  }

  Future<GetMovieListResponse> searchMoviesResponse(String query) async {
    try {
      final response = await dio.get(
        '/search/movie',
        queryParameters: {'query': query},
        options: applyOptions(headers: _headers(AppConstants.movieDBApiToken)),
      );

      return GetMovieListResponse.fromMap(response.data);
    } on DioException catch (e) {
      throw exceptionHandler(
        e,
        onBadResponse: (data) {
          final errorResponse = TheMovieDbErrorResponse.fromMap(data);
          return errorResponse.statusMessage;
        },
      );
    }
  }
}
