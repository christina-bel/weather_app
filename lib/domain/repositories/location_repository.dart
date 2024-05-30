import 'package:weather_app/domain/models/location/location.dart';

abstract class ILocationRepository {
  Future<Location?> getLocation(String name);
}
