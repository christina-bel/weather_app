import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';
part 'location.g.dart';

@freezed
class LocationResponse with _$LocationResponse {
  const factory LocationResponse({
    @Default([]) List<Location> results,
  }) = _LocationResponse;

  factory LocationResponse.fromJson(Map<String, Object?> json) =>
      _$LocationResponseFromJson(json);
}

@freezed
class Location with _$Location {
  const factory Location({
    required int id,
    required String name,
    required double latitude,
    required double longitude,
  }) = _Location;

  factory Location.fromJson(Map<String, Object?> json) =>
      _$LocationFromJson(json);
}
