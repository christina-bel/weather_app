// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherStateImpl _$$WeatherStateImplFromJson(Map<String, dynamic> json) =>
    _$WeatherStateImpl(
      status: $enumDecode(_$WeatherStatusEnumMap, json['status']),
      units: $enumDecode(_$TemperatureUnitsEnumMap, json['units']),
      weather: Weather.fromJson(json['weather'] as Map<String, dynamic>),
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$WeatherStateImplToJson(_$WeatherStateImpl instance) =>
    <String, dynamic>{
      'status': _$WeatherStatusEnumMap[instance.status]!,
      'units': _$TemperatureUnitsEnumMap[instance.units]!,
      'weather': instance.weather,
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
    };

const _$WeatherStatusEnumMap = {
  WeatherStatus.initial: 'initial',
  WeatherStatus.loading: 'loading',
  WeatherStatus.success: 'success',
  WeatherStatus.failure: 'failure',
};

const _$TemperatureUnitsEnumMap = {
  TemperatureUnits.fahrenheit: 'fahrenheit',
  TemperatureUnits.celsius: 'celsius',
};
