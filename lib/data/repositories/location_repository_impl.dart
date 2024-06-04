import 'package:weather_app/data/api/network/services/location_api/location_api.dart';
import 'package:weather_app/domain/models/location/location.dart';
import 'package:weather_app/domain/repositories/location_repository.dart';

class LocationRepositoryImpl extends ILocationRepository {
  final LocationApi _api;

  LocationRepositoryImpl({LocationApi? api}) : _api = api ?? LocationApi();

  @override
  Future<Location> getLocation(String name) async {
    final response = await _api.getLocation(name);

    final location = LocationResponse.fromJson(response.data);
    if (location.results.isEmpty) {
      throw Exception('Not found location');
    }
    return location.results.first;
  }
}
