import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:three_thousand_words/app/core/http/http_core.dart';
import 'package:three_thousand_words/app/core/http/interceptors.dart';

class HttpCoreImpl implements HttpCore {
  late final Dio _dio;

  final logger = Logger();

  HttpCoreImpl()
      : _dio = Dio(
          BaseOptions(
              headers: {'Content-Type': 'application/json; charset=UTF-8'},
              responseType: ResponseType.json,
              sendTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 10)),
        )..interceptors.addAll([LoggerInterceptor()]);

  @override
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return response;
    } on DioException catch (error, stacktrace) {
      logger.e('${error.message}', error: error.error, stackTrace: stacktrace);
      rethrow;
    }
  }

  @override
  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: data,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return response;
    } on DioException catch (error, stacktrace) {
      logger.e('${error.message}', error: error.error, stackTrace: stacktrace);
      rethrow;
    }
  }

  @override
  Future<Response> put(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return response;
    } on DioException catch (error, stacktrace) {
      logger.e('${error.message}', error: error.error, stackTrace: stacktrace);
      rethrow;
    }
  }

  @override
  Future<dynamic> delete(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return response.data;
    } on DioException catch (error, stacktrace) {
      logger.e('${error.message}', error: error.error, stackTrace: stacktrace);
      rethrow;
    }
  }
}
