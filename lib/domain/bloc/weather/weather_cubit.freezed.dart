// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeatherState _$WeatherStateFromJson(Map<String, dynamic> json) {
  return _WeatherState.fromJson(json);
}

/// @nodoc
mixin _$WeatherState {
  WeatherStatus get status => throw _privateConstructorUsedError;
  TemperatureUnits get units => throw _privateConstructorUsedError;
  Weather get weather => throw _privateConstructorUsedError;
  DateTime? get lastUpdated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherStateCopyWith<WeatherState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherStateCopyWith<$Res> {
  factory $WeatherStateCopyWith(
          WeatherState value, $Res Function(WeatherState) then) =
      _$WeatherStateCopyWithImpl<$Res, WeatherState>;
  @useResult
  $Res call(
      {WeatherStatus status,
      TemperatureUnits units,
      Weather weather,
      DateTime? lastUpdated});

  $WeatherCopyWith<$Res> get weather;
}

/// @nodoc
class _$WeatherStateCopyWithImpl<$Res, $Val extends WeatherState>
    implements $WeatherStateCopyWith<$Res> {
  _$WeatherStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? units = null,
    Object? weather = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WeatherStatus,
      units: null == units
          ? _value.units
          : units // ignore: cast_nullable_to_non_nullable
              as TemperatureUnits,
      weather: null == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as Weather,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WeatherCopyWith<$Res> get weather {
    return $WeatherCopyWith<$Res>(_value.weather, (value) {
      return _then(_value.copyWith(weather: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherStateImplCopyWith<$Res>
    implements $WeatherStateCopyWith<$Res> {
  factory _$$WeatherStateImplCopyWith(
          _$WeatherStateImpl value, $Res Function(_$WeatherStateImpl) then) =
      __$$WeatherStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {WeatherStatus status,
      TemperatureUnits units,
      Weather weather,
      DateTime? lastUpdated});

  @override
  $WeatherCopyWith<$Res> get weather;
}

/// @nodoc
class __$$WeatherStateImplCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res, _$WeatherStateImpl>
    implements _$$WeatherStateImplCopyWith<$Res> {
  __$$WeatherStateImplCopyWithImpl(
      _$WeatherStateImpl _value, $Res Function(_$WeatherStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? units = null,
    Object? weather = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(_$WeatherStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WeatherStatus,
      units: null == units
          ? _value.units
          : units // ignore: cast_nullable_to_non_nullable
              as TemperatureUnits,
      weather: null == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as Weather,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherStateImpl implements _WeatherState {
  const _$WeatherStateImpl(
      {required this.status,
      required this.units,
      required this.weather,
      this.lastUpdated});

  factory _$WeatherStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherStateImplFromJson(json);

  @override
  final WeatherStatus status;
  @override
  final TemperatureUnits units;
  @override
  final Weather weather;
  @override
  final DateTime? lastUpdated;

  @override
  String toString() {
    return 'WeatherState(status: $status, units: $units, weather: $weather, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.units, units) || other.units == units) &&
            (identical(other.weather, weather) || other.weather == weather) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, units, weather, lastUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherStateImplCopyWith<_$WeatherStateImpl> get copyWith =>
      __$$WeatherStateImplCopyWithImpl<_$WeatherStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherStateImplToJson(
      this,
    );
  }
}

abstract class _WeatherState implements WeatherState {
  const factory _WeatherState(
      {required final WeatherStatus status,
      required final TemperatureUnits units,
      required final Weather weather,
      final DateTime? lastUpdated}) = _$WeatherStateImpl;

  factory _WeatherState.fromJson(Map<String, dynamic> json) =
      _$WeatherStateImpl.fromJson;

  @override
  WeatherStatus get status;
  @override
  TemperatureUnits get units;
  @override
  Weather get weather;
  @override
  DateTime? get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$WeatherStateImplCopyWith<_$WeatherStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
