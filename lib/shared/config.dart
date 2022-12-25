import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum FetchDataMethod { get, post, put, delete }

enum Environment { production, development }

enum TokenLabel { none, xa, tokenId }

class Config {
  Config();

  static String apiKey = '45865970ebbfbc127eb2a16dd7f753e7';
  static FontWeight light = FontWeight.w100;
  static FontWeight regular = FontWeight.w400;
  static FontWeight medium = FontWeight.w500;
  static FontWeight semiBold = FontWeight.w600;
  static FontWeight bold = FontWeight.w700;
  static FontWeight verryBold = FontWeight.w800;
  static FontWeight superBold = FontWeight.w900;

  static Color whiteColor = Colors.white;
  static Color blackColor = Colors.black;
  static Color alertColor = const Color(0xffED6363);
  static Color primaryColor = const Color(0xff126CF4);
  static Color softBlue = const Color(0xff82DAF4);
  static Color softBlue2 = const Color(0xff78D1F5);
  static Color transparentColor = Colors.transparent;
  static Color grayColor1 = const Color(0xff687B92);
  static Color grayColor2 = const Color(0xff68798F);
  static Color grayColor3 = const Color(0xff69B5FF);
  static Color backgroundColor = const Color(0xff000918);
  static Color cardBorderColor = const Color(0xff272727);

  static String defaultFont = 'Open Sauce Sans';

  static TextStyle primaryTextStyle = GoogleFonts.poppins(
    color: primaryColor,
    decoration: TextDecoration.none,
  );

  static TextStyle blackTextStyle = GoogleFonts.poppins(
    color: blackColor,
    decoration: TextDecoration.none,
  );
  static TextStyle grayTextStyle = GoogleFonts.poppins(
    color: grayColor1,
    decoration: TextDecoration.none,
  );

  static TextStyle whiteTextStyle = GoogleFonts.poppins(
    color: whiteColor,
    decoration: TextDecoration.none,
  );

  static MaterialColor colorBluePrimary = const MaterialColor(
    0xff126CF4,
    <int, Color>{
      50: Color(0xff126CF4),
      100: Color(0xff126CF4),
      200: Color(0xff126CF4),
      300: Color(0xff126CF4),
      400: Color(0xff126CF4),
      500: Color(0xff126CF4),
      600: Color(0xff126CF4),
      700: Color(0xff126CF4),
      800: Color(0xff126CF4),
      900: Color(0xff126CF4),
    },
  );

  static MaterialColor colorWhitePrimary = const MaterialColor(
    0xFFf7faff,
    <int, Color>{
      50: Color(0xFFf7faff),
      100: Color(0xFFf7faff),
      200: Color(0xFFf7faff),
      300: Color(0xFFf7faff),
      400: Color(0xFFf7faff),
      500: Color(0xFFf7faff),
      600: Color(0xFFf7faff),
      700: Color(0xFFf7faff),
      800: Color(0xFFf7faff),
      900: Color(0xFFf7faff),
    },
  );

  static MaterialColor colorBlackPrimary = const MaterialColor(
    0xFF535557,
    <int, Color>{
      50: Color(0xFF535557),
      100: Color(0xFF535557),
      200: Color(0xFF535557),
      300: Color(0xFF535557),
      400: Color(0xFF535557),
      500: Color(0xFF535557),
      600: Color(0xFF535557),
      700: Color(0xFF535557),
      800: Color(0xFF535557),
      900: Color(0xFF535557),
    },
  );

  static Environment env = Environment.production;

  static String domain =
      env == Environment.production ? 'https://api.openweathermap.org/' : '';
}
