import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/shared/config.dart';

class HomePageUpdateUi extends StatelessWidget {
  const HomePageUpdateUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 135.w,
      margin: EdgeInsets.only(top: 15.sp),
      padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.sp),
        border: Border.all(
          color: Config.whiteColor,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 6.w,
            height: 6.w,
            margin: EdgeInsets.only(right: 4.w),
            decoration: BoxDecoration(
              color: const Color(0xffFFF30F),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          Text(
            'Updatex 10min ago',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 11.w,
                ),
          ),
        ],
      ),
    );
  }
}
