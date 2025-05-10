import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sky_pulse/model/weather.dart';


class WeatherService {
  static final String _apiKey = dotenv.env['OPENWEATHER_API_KEY'] ?? '';
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<Weather?> fetchWeather(String city) async {
    try {
      final uri = Uri.parse('$_baseUrl?q=$city&appid=$_apiKey&units=metric');
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return Weather.fromJson(data);
      } else {
        log('❌ Error fetching weather: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      log('⚠️ Exception in fetchWeather: $e');
      return null;
    }
  }
}
