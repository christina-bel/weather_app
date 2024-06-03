import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app/data/api/network/interceptors/logger_interceptor.dart';

/// Base api service with dio init
abstract class ApiServiceBase {
  static const _timeoutDuration = Duration(milliseconds: 30000);

  late final Dio _dio;

  ApiServiceBase({required String baseUrl}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        contentType: 'application/json',
        connectTimeout: _timeoutDuration,
        receiveTimeout: _timeoutDuration,
      ),
    );
    _addInterceptors();
  }

  get dio => _dio;

  /// Method for adding all necessary interceptors for dio
  void _addInterceptors() {
    if (kDebugMode) {
      _dio.interceptors.add(LoggerInterceptor());
    }
  }
}
