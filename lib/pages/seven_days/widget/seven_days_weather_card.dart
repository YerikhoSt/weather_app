import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/models/weather_daily_model.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/shared/config.dart';
import 'package:weather_app/widgets/image_weather.dart';

class SevenDaysWeatherCard extends StatelessWidget {
  final WeatherDailyModel weather;
  final void Function()? onTap;
  const SevenDaysWeatherCard({super.key, required this.weather, this.onTap});

  @override
  Widget build(BuildContext context) {
    var date = DateFormat('EEE').format(weather.time);

    return InkWell(
      onTap: onTap,
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: const <int, TableColumnWidth>{
          0: FlexColumnWidth(80),
          1: FlexColumnWidth(90),
          2: FlexColumnWidth(110),
        },
        children: <TableRow>[
          TableRow(
            children: <Widget>[
              SizedBox(
                height: 60,
                child: Row(
                  children: [
                    SizedBox(
                      width: 40.sp,
                    ),
                    Text(
                      date,
                      style: Config.grayTextStyle.copyWith(
                        color: Config.grayColor2,
                        fontSize: 16.sp,
                        fontWeight: Config.medium,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60,
                child: Row(
                  children: <Widget>[
                    ImageWeather(
                      iconId: weather.iconId,
                      width: 46,
                      height: 46,
                    ),
                    Text(
                      weather.main,
                      style: Config.grayTextStyle.copyWith(
                        fontSize: 16.sp,
                        fontWeight: Config.medium,
                        color: Config.grayColor2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60,
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: double.parse(weather.suhu) < 10
                          ? '+${weather.suhu.replaceRange(1, null, ' ')}°'
                          : '+${weather.suhu.replaceRange(2, null, ' ')}°',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 16.sp,
                            fontWeight: Config.medium,
                          ),
                      children: [
                        TextSpan(
                          text: double.parse(weather.suhu) < 10
                              ? '+${weather.maxSuhu!.replaceRange(1, null, ' ')}°'
                              : '+${weather.maxSuhu!.replaceRange(2, null, ' ')}°',
                          style: Config.grayTextStyle.copyWith(
                            fontSize: 16.sp,
                            color: Config.grayColor2,
                            fontWeight: Config.medium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
