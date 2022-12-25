import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageWeather extends StatelessWidget {
  final String iconId;
  final int width;
  final int height;
  const ImageWeather(
      {super.key, required this.iconId, this.width = 45, this.height = 45});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: 'http://openweathermap.org/img/wn/$iconId@4x.png',
      imageBuilder: (_, ImageProvider imageProvider) {
        return Container(
          width: width.sp,
          height: height.sp,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      errorWidget: (_, __, ___) => Container(
        width: width.sp,
        height: height.sp,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/cloud.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (_, __) => SizedBox(
        height: height.sp,
        width: width.sp,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
