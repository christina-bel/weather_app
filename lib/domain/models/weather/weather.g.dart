// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherResponseImpl _$$WeatherResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$WeatherResponseImpl(
      currentWeather: json['current_weather'] == null
          ? null
          : Weather.fromJson(json['current_weather'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WeatherResponseImplToJson(
        _$WeatherResponseImpl instance) =>
    <String, dynamic>{
      'current_weather': instance.currentWeather,
    };

_$WeatherImpl _$$WeatherImplFromJson(Map<String, dynamic> json) =>
    _$WeatherImpl(
      temperature: (json['temperature'] as num).toDouble(),
      weatherCode: (json['weathercode'] as num).toDouble(),
    );

Map<String, dynamic> _$$WeatherImplToJson(_$WeatherImpl instance) =>
    <String, dynamic>{
      'temperature': instance.temperature,
      'weathercode': instance.weatherCode,
    };
