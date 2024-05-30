import 'package:dio/dio.dart';
import 'package:weather_app/data/api/network/interceptors/logger_interceptor.dart';

/// Base api service with dio init
abstract class ApiServiceBase {
  static const _timeoutDuration = Duration(milliseconds: 30000);

  late final Dio _dio;

  /// Constructor is needed to add interceptors
  ApiServiceBase({required String baseUrl}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        contentType: 'application/json',
        connectTimeout: _timeoutDuration,
        receiveTimeout: _timeoutDuration,
      ),
    );
    addInterceptors();
  }

  get dio => _dio;

  Dio addInterceptors() => _dio..interceptors.add(LoggerInterceptor());
}
