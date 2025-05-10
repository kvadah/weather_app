import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:sky_pulse/controller/weather_controller.dart';
import 'package:sky_pulse/widget/weather_card.dart';

void main() async{
  await dotenv.load();
  runApp(
    ChangeNotifierProvider(
      create: (_) => WeatherController(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  WeatherHomePage(),
    );
  }
}
class WeatherHomePage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final weatherCtrl = Provider.of<WeatherController>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Weather App')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter City'),
              onSubmitted: (value) {
                weatherCtrl.getWeather(value);
              },
            ),
            const SizedBox(height: 20),
            if (weatherCtrl.isLoading) CircularProgressIndicator(),
            if (weatherCtrl.weather != null)
              WeatherCard(weather: weatherCtrl.weather!),
          ],
        ),
      ),
    );
  }
}