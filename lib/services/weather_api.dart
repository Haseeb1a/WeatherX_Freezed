import 'package:checkweather/model/weather_model.dart';
import 'package:dio/dio.dart';

class WeatherConnection {
  final Dio dio = Dio();
  static const String apiKey =
      '3837f082b65893f0fc5883912ebd9ac8'; // Replace with your actual API key

  Future<WeatherResponse> fetchWeatherData(String place) async {
    try {
      final response = await dio.get(
        "https://api.openweathermap.org/data/2.5/weather?q=$place&appid=$apiKey&units=metric",
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        print(data);
        return WeatherResponse.fromJson(data);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
    } catch (e) {
      // Handle Dio errors or other exceptions
      print('Error fetching weather data: $e');
      throw e; // Rethrow the exception for upper-level handling if needed
    }
  }
}
