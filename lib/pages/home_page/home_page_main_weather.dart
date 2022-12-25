import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/weather_app_controller.dart';
import 'package:weather_app/pages/home_page/widget/home_page_header.dart';
import 'package:weather_app/pages/home_page/widget/home_page_main_weather_widget.dart';
import 'package:weather_app/pages/home_page/widget/home_page_update_ui.dart';
import 'package:weather_app/shared/config.dart';

class HomePageMainWeather extends GetView<WeatherAppController> {
  const HomePageMainWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 680,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(
            top: 20,
            bottom: 0,
            left: 22.sp,
            right: 22.sp,
            child: Container(
              height: 640.sp,
              decoration: BoxDecoration(
                color: const Color(0xff053F8D).withOpacity(0.6),
                borderRadius: BorderRadius.circular(53.r),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 635.sp,
            margin: EdgeInsets.all(10.w),
            padding: EdgeInsets.fromLTRB(0.sp, 34.sp, 0, 0.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(63.r),
              border: Border.all(
                color: Config.softBlue2.withOpacity(0.85),
                width: 2,
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                tileMode: TileMode.repeated,
                colors: [
                  Config.softBlue,
                  Config.primaryColor,
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const HomePageHeader(
                  isHome: true,
                ),
                const HomePageUpdateUi(),
                Obx(
                  () => controller.loadingWeather.value
                      ? Container(
                          margin: EdgeInsets.only(top: 100.h),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context).cardColor,
                            ),
                          ),
                        )
                      : Obx(
                          () => HomePageMainWeatherWidget(
                            weather: controller.weatherChoice.value ??
                                controller.listHourlyWeather.value[0],
                          ),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
