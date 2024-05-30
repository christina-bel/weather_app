import 'package:weather_app/data/api/network/services/location_api/location_api.dart';
import 'package:weather_app/domain/models/location/location.dart';
import 'package:weather_app/domain/repositories/location_repository.dart';

class LocationRepositoryImpl extends ILocationRepository {
  LocationRepositoryImpl(this._locationApi);

  final LocationApi _locationApi;

  @override
  Future<Location?> getLocation(String name) async {
    try {
      final response = await _locationApi.getLocation(name);

      final location = LocationResponse.fromJson(response.data);

      return location.results.isEmpty ? null : location.results.first;
    } catch (e) {
      rethrow;
    }
  }
}
