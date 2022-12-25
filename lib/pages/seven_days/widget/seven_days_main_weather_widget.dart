import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/models/weather_daily_model.dart';
import 'package:weather_app/pages/seven_days/widget/main_weather_daily_detail.dart';
import 'package:weather_app/shared/config.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/shared/localization/localization_constants.dart';
import 'package:weather_app/widgets/image_weather.dart';

class SevenDaysMainWeatherWidget extends StatelessWidget {
  final WeatherDailyModel weather;
  const SevenDaysMainWeatherWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    final tomorrow = DateTime.now().day + 1;
    var date = DateFormat('EEE').format(weather.time);

    return Column(
      children: <Widget>[
        Row(
          children: [
            ImageWeather(
              iconId: weather.iconId,
              width: 166,
              height: 166,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  weather.time.day == tomorrow
                      ? getTranslated(context, 'besok') ?? 'Tommorow'
                      : date,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 18.sp,
                        fontWeight: Config.semiBold,
                      ),
                ),
                SizedBox(height: 3.sp),
                RichText(
                  text: TextSpan(
                    text: double.parse(weather.suhu) < 10
                        ? weather.suhu.replaceRange(1, null, ' ')
                        : weather.suhu.replaceRange(2, null, ' '),
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 36.sp,
                          fontWeight: Config.superBold,
                        ),
                    children: [
                      TextSpan(
                        text: double.parse(weather.suhu) < 10
                            ? '/${weather.maxSuhu!.replaceRange(1, null, ' ')}°'
                            : '/${weather.maxSuhu!.replaceRange(2, null, ' ')}°',
                        style: Config.grayTextStyle.copyWith(
                          fontSize: 26.sp,
                          fontWeight: Config.bold,
                          color: const Color(0xff71CBFB),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  weather.description,
                  style: Config.grayTextStyle.copyWith(
                    fontSize: 16.sp,
                    color: const Color(0xff71CBFB),
                    fontWeight: Config.semiBold,
                  ),
                ),
              ],
            ),
          ],
        ),
        MainWeatherDailyModel(weather: weather),
      ],
    );
  }
}
