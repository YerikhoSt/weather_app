import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/weather_app_controller.dart';
import 'package:weather_app/pages/home_page/widget/home_page_today_card.dart';
import 'package:weather_app/pages/seven_days/seven_days.dart';
import 'package:weather_app/shared/animation.dart';
import 'package:weather_app/shared/config.dart';
import 'package:weather_app/shared/localization/localization_constants.dart';

class HomePageTodayBody extends GetView<WeatherAppController> {
  const HomePageTodayBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 39.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Today',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 18.sp,
                      fontWeight: Config.verryBold,
                    ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).push(
                  AnimationRoute(
                    child: const SevenDays(),
                  ),
                ),
                child: Text(
                  '${getTranslated(context, 'seven') ?? '7 days'} >',
                  style: Config.blackTextStyle.copyWith(
                    fontSize: 12.sm,
                    color: Config.grayColor1,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 135.w,
            width: MediaQuery.of(context).size.width,
            child: Obx(
              () => ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 10.sp),
                scrollDirection: Axis.horizontal,
                itemCount: controller.listHourlyWeather.sublist(0, 24).length,
                itemBuilder: (context, index) {
                  return Obx(
                    () => HomePageTodayCard(
                      isSelected: controller.weatherChoice.value ==
                          controller.listHourlyWeather[index],
                      weather: controller.listHourlyWeather[index],
                      onTap: () {
                        if (controller.weatherChoice.value ==
                            controller.listHourlyWeather[index]) {
                          controller.weatherChoice.value =
                              controller.currentWeather.value;
                        } else {
                          controller.weatherChoice.value =
                              controller.listHourlyWeather[index];
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
