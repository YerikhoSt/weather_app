import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/shared/config.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/widgets/image_weather.dart';
import 'package:weather_app/widgets/main_weather_detail.dart';

class HomePageMainWeatherWidget extends StatelessWidget {
  final WeatherModel weather;

  const HomePageMainWeatherWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    var date = DateFormat('dd MMM').format(weather.time);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        ImageWeather(
          iconId: weather.iconId,
          width: 300,
          height: 160,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              double.parse(weather.suhu) < 10
                  ? weather.suhu.replaceRange(1, null, ' ')
                  : weather.suhu.replaceRange(2, null, ' '),
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 96.sp,
                    fontWeight: Config.bold,
                  ),
            ),
            Text(
              '°',
              style: Config.grayTextStyle.copyWith(
                fontSize: 46.sp,
                height: 0,
                color: const Color(0xff82B5F8),
                fontWeight: Config.semiBold,
              ),
            ),
          ],
        ),
        Text(
          weather.description,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 22.sp,
                fontWeight: Config.verryBold,
              ),
        ),
        Text(
          'Today, $date',
          style: Config.grayTextStyle.copyWith(
            fontSize: 12.sp,
            fontWeight: Config.medium,
            color: Config.grayColor3,
          ),
        ),
        SizedBox(height: 30.sp),
        MainWeatherDetail(weather: weather),
      ],
    );
  }
}
