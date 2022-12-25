import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/shared/config.dart';

void showDialogCustom(String message, BuildContext context, String title) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: Text(
          title,
          style: Config.blackTextStyle.copyWith(
            fontSize: 16.sp,
            fontWeight: Config.semiBold,
          ),
        ),
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          TextButton(
            child: const Text("Open Settings"),
            onPressed: () {
              Geolocator.openLocationSettings();
            },
          ),
        ],
      );
    },
  );
}
