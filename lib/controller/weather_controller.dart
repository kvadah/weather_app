import 'package:flutter/material.dart';
import 'package:sky_pulse/model/weather.dart';
import 'package:sky_pulse/weather.service.dart';

class WeatherController extends ChangeNotifier {
  final WeatherService _weatherService = WeatherService();
  Weather? _weather;
  bool _isLoading = false;

  Weather? get weather => _weather;
  bool get isLoading => _isLoading;

  Future<void> getWeather(String city) async {
    _isLoading = true;
    notifyListeners();

    try {
      _weather = await _weatherService.fetchWeather(city);
    } catch (_) {
      _weather = null;
    }

    _isLoading = false;
    notifyListeners();
  }
}
