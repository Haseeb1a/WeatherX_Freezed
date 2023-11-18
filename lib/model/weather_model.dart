import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model.freezed.dart';
part 'weather_model.g.dart';
@freezed
class WeatherResponse with _$WeatherResponse {
  const factory WeatherResponse({
    Main? main, // Add '?' to indicate nullable// Add '?' to indicate nullable
    Wind? wind, // Add '?' to indicate nullable
    required String? name,
  }) = _WeatherResponse;

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);
}


@freezed
class Wind with _$Wind {
  factory Wind({
    required double speed,
    required int deg,
    double? gust,
  }) = _Wind;

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}

@freezed
class Main with _$Main {
  factory Main({
    // ignore: invalid_annotation_target
   @JsonKey(name: "temp") double? temp,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'feels_like')double? feelslikes,
    required int? pressure,
    required int? humidity,
  }) = _Main;

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
}

