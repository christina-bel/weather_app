import 'package:weather_app/domain/models/location/location.dart';

abstract class ILocationRepository {
  /// Finds [Location] for given [city]
  Future<Location> getLocation(String city);
}
