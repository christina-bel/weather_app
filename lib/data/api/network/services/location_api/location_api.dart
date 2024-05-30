import 'package:dio/dio.dart';
import 'package:weather_app/data/api/network/services/api_service_base.dart';

import 'location_api_params.dart';
import 'location_api_paths.dart';

class LocationApi extends ApiServiceBase {
  LocationApi({super.baseUrl = LocationApiPaths.baseUrl});

  Future<Response> getLocation(String name) async {
    final query = {
      LocationApiParams.name: name,
      LocationApiParams.count: '1',
    };
    final response = await dio.get(
      LocationApiPaths.search,
      queryParameters: query,
    );

    return response;
  }
}
