import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/shared/config.dart';
import 'package:weather_app/widgets/image_weather.dart';

class HomePageTodayCard extends StatelessWidget {
  final WeatherModel weather;
  final void Function()? onTap;
  final bool isSelected;
  const HomePageTodayCard(
      {super.key, required this.weather, this.onTap, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(27.r),
      child: Container(
        width: 76.w,
        padding: EdgeInsets.all(9.sp),
        margin: EdgeInsets.only(right: 10.w),
        decoration: BoxDecoration(
          color: isSelected == true ? null : Config.transparentColor,
          border: Border.all(
            color: Config.cardBorderColor,
            width: 1.sp,
          ),
          gradient: isSelected == true
              ? LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.2, 0.8],
                  colors: [
                    Config.softBlue,
                    Config.primaryColor,
                  ],
                )
              : null,
          borderRadius: BorderRadius.circular(27.r),
        ),
        child: Column(
          children: <Widget>[
            Text(
              double.parse(weather.suhu) < 10
                  ? '${weather.suhu.replaceRange(1, null, ' ')}°'
                  : '${weather.suhu.replaceRange(2, null, ' ')}°',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 16.sp,
                    fontWeight: Config.bold,
                  ),
            ),
            ImageWeather(iconId: weather.iconId),
            Text(
              weather.time.hour == 0
                  ? '${weather.time.month}/${weather.time.day}'
                  : '${weather.time.hour}:00',
              style: Config.grayTextStyle.copyWith(
                fontSize: 12.sp,
                color: isSelected == true ? Config.whiteColor : null,
                fontWeight: Config.medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
