import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/models/weather_daily_model.dart';
import 'package:weather_app/shared/config.dart';

class MainWeatherDailyModel extends StatelessWidget {
  final WeatherDailyModel weather;
  const MainWeatherDailyModel({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: <Widget>[
            Image.asset(
              'assets/images/wind_speed.png',
              width: 20.sp,
              height: 20.sp,
            ),
            SizedBox(height: 5.sp),
            Text(
              '${weather.windSpeed}Kmph',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 13.sp,
                    fontWeight: Config.medium,
                  ),
            ),
            Text(
              'Wind',
              style: Config.grayTextStyle.copyWith(
                fontSize: 12.sp,
                color: Config.grayColor3,
                fontWeight: Config.medium,
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Image.asset(
              'assets/images/humadity.png',
              width: 20.sp,
              height: 20.sp,
            ),
            SizedBox(height: 5.sp),
            Text(
              '${weather.humidity}%',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 13.sp,
                    fontWeight: Config.medium,
                  ),
            ),
            Text(
              'Humidity',
              style: Config.grayTextStyle.copyWith(
                fontSize: 12.sp,
                color: Config.grayColor3,
                fontWeight: Config.medium,
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Image.asset(
              'assets/images/chance.png',
              width: 20.sp,
              height: 20.sp,
            ),
            SizedBox(height: 5.sp),
            Text(
              '${weather.precipitation}%',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 13.sp,
                    fontWeight: Config.medium,
                  ),
            ),
            Text(
              'Chance of rain',
              style: Config.grayTextStyle.copyWith(
                fontSize: 12.sp,
                color: Config.grayColor3,
                fontWeight: Config.medium,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
