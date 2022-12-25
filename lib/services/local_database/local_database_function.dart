import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/models/weather_daily_model.dart';
import 'objectbox.g.dart';

class WeatherLocal {
  late final Store _store;
  late final Box<WeatherModel> _weatherBox;
  late final Box<WeatherDailyModel> _weatherDailyBox;

  WeatherLocal._init(this._store) {
    _weatherBox = Box<WeatherModel>(_store);
    _weatherDailyBox = Box<WeatherDailyModel>(_store);
  }

  static Future<WeatherLocal> init() async {
    final store = await openStore();
    return WeatherLocal._init(store);
  }

  WeatherModel? getWeather(int id) => _weatherBox.get(id);
  List<WeatherModel> getWeathers() => _weatherBox.getAll();
  int insertWeather(WeatherModel weather) => _weatherBox.put(weather);
  void deleteAllWeather() => _weatherBox.removeAll();
  bool deleteWeather(int id) => _weatherBox.remove(id);

  //DAILY WEATHER
  WeatherDailyModel? getWeatherDaily(int id) => _weatherDailyBox.get(id);
  List<WeatherDailyModel> getWeathersDaily() => _weatherDailyBox.getAll();
  void deleteAllWeatherDaily() => _weatherDailyBox.removeAll();
  int insertWeatherDaily(WeatherDailyModel weather) =>
      _weatherDailyBox.put(weather);
  bool deleteWeatherDaily(int id) => _weatherDailyBox.remove(id);
}
