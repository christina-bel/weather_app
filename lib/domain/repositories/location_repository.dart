import 'package:weather_app/domain/models/location/location.dart';

abstract class ILocationRepository {
  /// Finds [Location] for given [name]
  Future<Location> getLocation(String name);
}
