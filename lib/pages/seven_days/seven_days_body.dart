import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/weather_app_controller.dart';
import 'package:weather_app/pages/seven_days/widget/seven_days_weather_card.dart';

class SevendDaysBody extends GetView<WeatherAppController> {
  const SevendDaysBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(
          bottom: 33.sp,
        ),
        itemCount: controller.listDailyWeather.length,
        itemBuilder: (context, index) {
          return SevenDaysWeatherCard(
            onTap: () {
              if (controller.weatherDailyChoice.value ==
                  controller.listDailyWeather[index]) {
                controller.weatherDailyChoice.value =
                    controller.listDailyWeather[0];
              } else {
                controller.weatherDailyChoice.value =
                    controller.listDailyWeather[index];
              }
            },
            weather: controller.listDailyWeather[index],
          );
        },
      ),
    );
  }
}
