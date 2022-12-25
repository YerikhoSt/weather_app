import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/weather_app_controller.dart';
import 'package:weather_app/pages/seven_days/seven_days_body.dart';
import 'package:weather_app/pages/seven_days/seven_days_main_weather.dart';

class SevenDays extends GetView<WeatherAppController> {
  const SevenDays({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView(
        children: const [
          SevenDaysMainWeather(),
          SevendDaysBody(),
        ],
      ),
    );
  }
}
