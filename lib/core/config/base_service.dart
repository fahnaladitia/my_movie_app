import 'package:dio/dio.dart';

import '../common/constants/error_constants.dart';
import '../common/exceptions/base_exception.dart';

abstract class BaseService {
  final Dio dio;

  BaseService(this.dio);
  Options applyOptions({Map<String, dynamic>? headers}) {
    return Options(headers: headers);
  }

  BaseException exceptionHandler(
    DioException e, {
    String? Function(dynamic data)? onBadResponse,
  }) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return BaseException(
          message: ErrorConstantsMessage.noInternetConnectionError,
          code: e.response?.statusCode,
        );
      case DioExceptionType.sendTimeout:
        return BaseException(
          message: ErrorConstantsMessage.sendTimeoutError,
          code: e.response?.statusCode,
        );
      case DioExceptionType.receiveTimeout:
        return BaseException(
          message: ErrorConstantsMessage.receiveTimeoutError,
          code: e.response?.statusCode,
        );
      case DioExceptionType.badResponse:
        final badResponseMessage = onBadResponse?.call(e.response?.data);
        return BaseException(
          message: badResponseMessage ?? 'Bad response: ${e.message}',
          code: e.response?.statusCode,
        );
      case DioExceptionType.cancel:
        return BaseException(message: ErrorConstantsMessage.cancelError, code: e.response?.statusCode);
      case DioExceptionType.badCertificate:
        return BaseException(message: ErrorConstantsMessage.badCertificateError, code: e.response?.statusCode);
      case DioExceptionType.connectionError:
        // No internet connection or Connection Error
        return BaseException(
            message: ErrorConstantsMessage.noInternetConnectionOrConnectionError, code: e.response?.statusCode);
      case DioExceptionType.unknown:
        return BaseException(message: ErrorConstantsMessage.unknownError, code: e.response?.statusCode);
      default:
        return BaseException(
          message: e.message ?? ErrorConstantsMessage.unknownError,
          code: e.response?.statusCode,
        );
    }
  }
}
