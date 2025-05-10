import 'package:flutter/material.dart';
import 'package:sky_pulse/model/weather.dart';

class WeatherCard extends StatelessWidget {
  final Weather weather;

  const WeatherCard({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(weather.city, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Image.network('https://openweathermap.org/img/wn/${weather.icon}@2x.png'),
            Text('${weather.temperature}°C', style: const TextStyle(fontSize: 32)),
            Text(weather.description, style: const TextStyle(fontSize: 18)),
            Text('Humidity: ${weather.humidity}%'),
            Text('Wind: ${weather.windSpeed} m/s'),
          ],
        ),
      ),
    );
  }
}
