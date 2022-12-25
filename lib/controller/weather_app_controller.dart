import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_daily_model.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/get_location.dart';
import 'package:weather_app/services/server.dart';
import 'package:weather_app/shared/config.dart';

class WeatherAppController extends GetxController {
  var lat = 0.0.obs;
  var long = 0.0.obs;
  var locationName = ''.obs;
  var listHourlyWeather = <WeatherModel>[].obs;
  var listDailyWeather = <WeatherDailyModel>[].obs;
  var loadingWeather = false.obs;
  var isSelected = false.obs;
  var selectedWeatherIndex = 0.obs;
  var currentWeather = Rxn<WeatherModel>();
  var weatherChoice = Rxn<WeatherModel>();
  var weatherDailyChoice = Rxn<WeatherDailyModel>();
  var changeLang = false.obs;

  Future<void> getLatLong(BuildContext context) async {
    await determinePosition(context).then((value) {
      lat.value = value.latitude;
      long.value = value.longitude;
    });
    List<Placemark> placemarks =
        await placemarkFromCoordinates(-6.200000, 106.816666);

    locationName.value = placemarks[0].country!;
  }

  Future<void> getDataWeather() async {
    listHourlyWeather.value = weatherLocal.getWeathers();
    listDailyWeather.value = weatherLocal.getWeathersDaily();
    weatherChoice.value = weatherLocal.getWeather(1);
    weatherDailyChoice.value = weatherLocal.getWeatherDaily(1);
    await fetchData(
            'data/2.5/onecall?lat=$lat&lon=$long&units=metric&appid=${Config.apiKey}')
        .then((value) {
      //INPUT CURRENT WEATHER
      DateTime currentTime = DateTime.fromMillisecondsSinceEpoch(
        value['current']['dt'] * 1000,
        isUtc: false,
      );
      currentWeather.value = WeatherModel(
        main: value['current']['weather'][0]['main'],
        time: currentTime,
        description: value['current']['weather'][0]['description'],
        suhu: value['current']['temp'].toString(),
        humidity: value['current']['humidity'],
        windSpeed: double.parse(value['current']['wind_speed'].toString()),
        precipitation: value['current']['clouds'],
        iconId: value['current']['weather'][0]['icon'],
      );

      weatherLocal.insertWeather(currentWeather.value!);
      weatherChoice.value = weatherLocal.getWeather(1);

      //INPUT TODAY WEATHER
      for (final i in value['hourly']) {
        DateTime time = DateTime.fromMillisecondsSinceEpoch(
          i['dt'] * 1000,
          isUtc: false,
        );
        WeatherModel todayWeather = WeatherModel(
          main: i['weather'][0]['main'],
          time: time,
          suhu: i['temp'].toString(),
          humidity: i['humidity'],
          windSpeed: double.parse(i['wind_speed'].toString()),
          precipitation: i['clouds'],
          iconId: i['weather'][0]['icon'],
          description: i['weather'][0]['description'],
        );

        weatherLocal.insertWeather(todayWeather);
        print('LENGHT ====> ${weatherLocal.getWeathers().length}');
        listHourlyWeather.value = weatherLocal.getWeathers();
        weatherChoice.value = weatherLocal.getWeather(1);
      }

      //INPUT DAILY WEATHER
      for (final d in value['daily']) {
        DateTime dailyTime = DateTime.fromMillisecondsSinceEpoch(
          d['dt'] * 1000,
          isUtc: false,
        );
        WeatherDailyModel dailyWeather = WeatherDailyModel(
          main: d['weather'][0]['main'],
          time: dailyTime,
          description: d['weather'][0]['description'],
          suhu: d['temp']['day'].toString(),
          humidity: d['humidity'],
          maxSuhu: d['temp']['max'].toString(),
          windSpeed: double.parse(d['wind_speed'].toString()),
          precipitation: d['clouds'],
          iconId: d['weather'][0]['icon'],
        );

        weatherLocal.insertWeatherDaily(dailyWeather);
        listDailyWeather.value = weatherLocal.getWeathersDaily();
        weatherDailyChoice.value = weatherLocal.getWeatherDaily(1);
      }
    });
  }

  Future<void> getWeather(BuildContext context) async {
    loadingWeather.value = true;

    await getLatLong(context);
    await getDataWeather();
    loadingWeather.value = false;
  }
}
