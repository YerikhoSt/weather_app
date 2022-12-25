import 'package:get/get.dart';
import 'package:weather_app/pages/home_page/home_page.dart';
import 'package:weather_app/pages/seven_days/seven_days.dart';
import 'package:weather_app/routes/weather_app.dart';

appRoutes() => [
      GetPage(
        name: '/',
        page: () => WeatherApp(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/home',
        page: () => const HomePage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/seven-days',
        page: () => const SevenDays(),
        middlewares: [MyMiddelware()],
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
    ];

class MyMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    return super.onPageCalled(page);
  }
}
