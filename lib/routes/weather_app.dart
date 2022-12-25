import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/weather_app_controller.dart';
import 'package:weather_app/pages/home_page/home_page.dart';
import 'package:get/get.dart';
import 'package:weather_app/routes/app_routes.dart';
import 'package:weather_app/shared/change_statusbar_color.dart';
import 'package:weather_app/shared/localization/custom_localization.dart';
import 'package:weather_app/shared/localization/localization_constants.dart';
import 'package:weather_app/shared/theme/theme_data_custom.dart';
import 'package:weather_app/shared/theme/theme_mode.dart';
import 'package:provider/single_child_widget.dart';

class WeatherApp extends StatefulWidget {
  //Function for set Local attribute in _MyAppState class from other class
  static void setLocale(BuildContext context, Locale locale) {
    final _WeatherAppBodyState? state =
        context.findAncestorStateOfType<_WeatherAppBodyState>();
    state!.setLocale(locale);
  }

  @override
  State createState() {
    return WeatherAppState();
  }
}

class WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<ThemeModeCustom>(
          create: (_) => ThemeModeCustom(),
        ),
      ],
      child: const WeatherAppBody(),
    );
  }
}

class WeatherAppBody extends StatefulWidget {
  const WeatherAppBody({super.key});
  static void setLocale(BuildContext context, Locale locale) {
    final _WeatherAppBodyState? state =
        context.findAncestorStateOfType<_WeatherAppBodyState>();
    state!.setLocale(locale);
  }

  @override
  State<WeatherAppBody> createState() => _WeatherAppBodyState();
}

class _WeatherAppBodyState extends State<WeatherAppBody> {
  ///Define default Locale variable
  late Locale? _locale;

  ///function for set local attribute class from parent class (MyApp)
  void setLocale(Locale locale) {
    setState(() => _locale = locale);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    getLocale().then((Locale? locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ThemeMode>(
      future: context.watch<ThemeModeCustom>().themeMode,
      builder: (_, AsyncSnapshot<ThemeMode> snapshot) {
        if (snapshot.data == ThemeMode.dark) {
          changeStatusBarColor(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: Colors.transparent);
        } else {
          changeStatusBarColor(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: Colors.transparent);
        }
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (BuildContext context, Widget? child) {
            return snapshot.hasData
                ? GetMaterialApp(
                    title: 'Weather App',
                    theme: ThemeDataCustom.light,
                    darkTheme: ThemeDataCustom.dark,
                    themeMode: ThemeMode.dark,
                    debugShowCheckedModeBanner: false,
                    initialRoute: '/',
                    getPages: appRoutes(),
                    //Add default locale class to MaterialApp locale attribute
                    locale: _locale,
                    supportedLocales: const <Locale>[
                      Locale('en', 'US'),
                      Locale('id', 'ID')
                    ],
                    //Add buildup delegate and custom delegate that we made
                    localizationsDelegates: const <
                        LocalizationsDelegate<dynamic>>[
                      CustomLocalizations.delegate, //Custom delegate
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    //Create callback logic for locale
                    localeResolutionCallback:
                        (Locale? locale, Iterable<Locale> supportedLocales) {
                      for (final Locale supportedLocale in supportedLocales) {
                        if (supportedLocale.languageCode ==
                                locale!.languageCode &&
                            supportedLocale.countryCode == locale.countryCode) {
                          return supportedLocale;
                        }
                      }
                      return supportedLocales
                          .first; //if default locale not support, use first local in supportedLocales list (english)
                    },
                    home: child,
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
          child: const HomePage(),
        );
      },
    );
  }
}
