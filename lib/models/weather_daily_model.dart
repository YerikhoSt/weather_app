import 'package:objectbox/objectbox.dart';

@Entity()
class WeatherDailyModel {
  int id;
  String main;
  int humidity;
  double windSpeed;
  int precipitation;
  DateTime time;
  String suhu;
  String? maxSuhu;
  String iconId;
  String description;

  WeatherDailyModel({
    this.id = 0,
    required this.main,
    required this.time,
    required this.description,
    required this.suhu,
    this.maxSuhu,
    required this.humidity,
    required this.windSpeed,
    required this.precipitation,
    required this.iconId,
  });
}
