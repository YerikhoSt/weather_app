import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/weather_app_controller.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/pages/home_page/home_page_main_weather.dart';
import 'package:weather_app/pages/home_page/home_page_today_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = Get.put(WeatherAppController());

  @override
  void initState() {
    controller.getWeather(context);
    super.initState();
  }

  @override
  void dispose() {
    controller.getWeather(context);
    controller.getDataWeather();
    controller.weatherChoice.value = weatherLocal.getWeather(1);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      extendBodyBehindAppBar: true,
      body: ListView(
        padding: EdgeInsets.only(top: 0, bottom: 20.sp),
        children: <Widget>[
          const HomePageMainWeather(),
          Obx(
            () => controller.listHourlyWeather.value.isEmpty
                ? Text(
                    'Loading...',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 18.sp,
                        ),
                    textAlign: TextAlign.center,
                  )
                : const HomePageTodayBody(),
          ),
        ],
      ),
    );
  }
}
