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

  Future<GetMovieListResponse> searchMoviesResponse({required String query, required int page}) async {
    try {
      final response = await dio.get(
        '/search/movie',
        queryParameters: {
          'query': query,
          'page': page,
        },
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

  Future<GetMovieVideoListResponse> getMovieVideoListResponse(String movieId) async {
    try {
      final response = await dio.get(
        '/movie/$movieId/videos',
        options: applyOptions(headers: _headers(AppConstants.movieDBApiToken)),
      );

      return GetMovieVideoListResponse.fromMap(response.data);
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
