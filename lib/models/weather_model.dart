import 'package:objectbox/objectbox.dart';

@Entity()
class WeatherModel {
  int id;
  String main;
  int humidity;
  double windSpeed;
  int precipitation;
  DateTime time;
  String suhu;
  String iconId;
  String description;

  WeatherModel({
    this.id = 0,
    required this.main,
    required this.time,
    required this.description,
    required this.suhu,
    required this.humidity,
    required this.windSpeed,
    required this.precipitation,
    required this.iconId,
  });
}
