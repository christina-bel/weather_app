import 'package:dio/dio.dart';
import 'package:weather_app/data/api/network/interceptors/logger_interceptor.dart';

/// Base api service with dio init
abstract class ApiServiceBase {
  /// Constructor is needed to add interceptors
  ApiServiceBase() {
    addInterceptors();
  }

  final Dio dio = Dio(
    BaseOptions(
      contentType: 'application/json',
      connectTimeout: const Duration(milliseconds: 30000),
      receiveTimeout: const Duration(milliseconds: 30000),
    ),
  );

  Dio addInterceptors() => dio..interceptors.add(LoggerInterceptor());
}
