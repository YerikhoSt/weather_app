import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/weather_app_controller.dart';
import 'package:weather_app/routes/weather_app.dart';
import 'package:weather_app/shared/config.dart';
import 'package:weather_app/shared/localization/localization_constants.dart';

class HomePageHeader extends StatefulWidget {
  final bool isHome;
  const HomePageHeader({super.key, required this.isHome});

  @override
  State<HomePageHeader> createState() => _HomePageHeaderState();
}

class _HomePageHeaderState extends State<HomePageHeader> {
  void _changeLanguage(Locale locale) {
    setLocale(locale.toString());
    WeatherApp.setLocale(context, locale);
  }

  var controller = Get.put(WeatherAppController());
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () => Get.back(),
          child: Image.asset(
            'assets/images/menu.png',
            width: 35.sp,
            height: 35.sp,
          ),
        ),
        widget.isHome
            ? Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 25.sp,
                    color: Config.whiteColor,
                  ),
                  SizedBox(width: 5.sp),
                  Obx(
                    () => Text(
                      controller.locationName.value,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 22.sp,
                            fontWeight: Config.bold,
                          ),
                      maxLines: 2,
                    ),
                  ),
                ],
              )
            : Row(
                children: <Widget>[
                  Icon(
                    Icons.calendar_month_outlined,
                    size: 25.sp,
                    color: Config.whiteColor,
                  ),
                  SizedBox(width: 5.sp),
                  Text(
                    getTranslated(context, 'seven') ?? '7 Days',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 22.sp,
                          fontWeight: Config.bold,
                        ),
                  ),
                ],
              ),
        InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return StatefulBuilder(
                    builder: (context, StateSetter setState) {
                  return Obx(
                    () => Container(
                      width: MediaQuery.of(context).size.width,
                      height: 320.h,
                      padding: EdgeInsets.symmetric(horizontal: 20.sp),
                      decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Theme.of(context).cardColor,
                            blurRadius: 10,
                            spreadRadius: 3,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.dark_mode_outlined,
                                color: Theme.of(context).iconTheme.color),
                            minLeadingWidth: 0,
                            contentPadding: const EdgeInsets.all(0),
                            title: Text(
                              getTranslated(context, 'mode_gelap') ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 14,
                                    fontWeight: Config.bold,
                                  ),
                            ),
                            trailing: Switch(
                              thumbColor: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? MaterialStateProperty.all<Color>(
                                      Theme.of(context).primaryColor)
                                  : null,
                              trackColor: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? MaterialStateProperty.all<Color>(
                                      Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.5))
                                  : null,
                              value: Theme.of(context).brightness ==
                                  Brightness.dark,
                              onChanged: (bool value) async {
                                Get.changeThemeMode(
                                    value ? ThemeMode.dark : ThemeMode.light);
                              },
                              activeTrackColor: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.3),
                              activeColor: Theme.of(context).primaryColor,
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              controller.changeLang.value =
                                  !controller.changeLang.value;
                            },
                            leading: Icon(
                              Icons.language_outlined,
                              color: Theme.of(context).iconTheme.color,
                              size: 25,
                            ),
                            minLeadingWidth: 0,
                            contentPadding: const EdgeInsets.all(0),
                            title: Text(
                              getTranslated(context, 'bahasa') ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 14,
                                  ),
                            ),
                            trailing: Icon(
                              controller.changeLang.value
                                  ? Icons.keyboard_arrow_up_outlined
                                  : Icons.keyboard_arrow_down_outlined,
                              color: Theme.of(context).iconTheme.color,
                              size: 30,
                            ),
                          ),
                          Visibility(
                            visible: controller.changeLang.value,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 15, top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                      setState(
                                        () {
                                          _changeLanguage(
                                              const Locale('id', 'ID'));
                                        },
                                      );

                                      controller.changeLang.value = false;
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.5,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(23),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            blurRadius: 2,
                                            spreadRadius: 0.1,
                                            offset: const Offset(1, 0),
                                          ),
                                        ],
                                        color:
                                            Theme.of(context).backgroundColor,
                                      ),
                                      child: Row(
                                        children: <Widget>[
                                          Image.asset(
                                            'assets/images/indo.png',
                                            width: 27,
                                            height: 27,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Indonesia',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        Config.semiBold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      _changeLanguage(const Locale('en', 'US'));

                                      controller.changeLang.value = false;
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.5,
                                      margin: const EdgeInsets.only(top: 10),
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(23),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            blurRadius: 2,
                                            spreadRadius: 0.1,
                                            offset: const Offset(1, 0),
                                          ),
                                        ],
                                        color:
                                            Theme.of(context).backgroundColor,
                                      ),
                                      child: Row(
                                        children: <Widget>[
                                          Image.asset(
                                            'assets/images/eng.png',
                                            width: 27,
                                            height: 27,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'English',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        Config.semiBold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
              },
            );
          },
          child: Icon(
            Icons.more_vert,
            size: 26.sp,
            color: Config.whiteColor,
          ),
        ),
      ],
    );
  }
}
