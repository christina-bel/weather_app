import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

/// Custom interceptor for logging network requests
class LoggerInterceptor extends Interceptor {
  final _logger = Logger();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.i(
      '<-- REQUEST[${options.method.toUpperCase()}] => URL: '
      '${options.baseUrl + options.path} => DATA: ${options.data} -->',
    );

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final requestOptions = response.requestOptions;

    _logger.t(
      '<-- RESPONSE[${response.statusCode}] : DATA ${response.data} => URL: '
      '${requestOptions.baseUrl}${requestOptions.path} -->',
    );

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final response = err.response;
    final requestOptions = response?.requestOptions;

    _logger.e(
      '<-- ERROR[${response?.statusCode}] : MESSAGE[${err.message}] => URL: '
      '${requestOptions?.baseUrl}${requestOptions?.path} -> '
      'DATA: ${response?.data} -->',
    );

    return super.onError(err, handler);
  }
}
