import 'package:weather_app/data/api/network/services/location_api/location_api.dart';
import 'package:weather_app/domain/models/location/location.dart';
import 'package:weather_app/domain/repositories/location_repository.dart';

class LocationRepositoryImpl extends ILocationRepository {
  LocationRepositoryImpl({LocationApi? api}) : _api = api ?? LocationApi();

  final LocationApi _api;

  @override
  Future<Location> getLocation(String city) async {
    final response = await _api.getLocation(city);

    final location = LocationResponse.fromJson(response.data);

    if (location.results.isEmpty) {
      throw Exception('Not found location');
    }
    return location.results.first;
  }
}
