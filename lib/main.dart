import 'package:flutter/material.dart';
import 'package:weather_app/routes/weather_app.dart';
import 'package:weather_app/services/local_database/local_database_function.dart';

late WeatherLocal weatherLocal;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  weatherLocal = await WeatherLocal.init();

  runApp(WeatherApp());
}
