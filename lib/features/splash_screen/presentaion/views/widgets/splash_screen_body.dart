import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/widgets/background_image.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        // SvgPicture.asset(
        //   AssetsData.backgroundImage,
        //   width: 375.w,
        //   height: 812.h,
        // ),
        // Center(
        //   child: SvgPicture.asset(
        //     fit: BoxFit.cover,
        //     AssetsData.logo2,
        //     width: 233.w,
        //     height: 231.h,
        //   ),
        // ),
        Center(
          child: Image.asset(
            AssetsData.logo1,
            width: 233.w,
            height: 231.h,
          ),
        ),
      ],
    );
  }
}
