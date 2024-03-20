import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothIndicatorWidget extends StatelessWidget {
  const SmoothIndicatorWidget({
    super.key,
    required this.bordingController,
  });

  final PageController bordingController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 143.w,
      bottom: 130.h,
      child: SmoothPageIndicator(
        controller: bordingController,
        count: 3,
        effect: ScrollingDotsEffect(
            activeDotColor: kPrimaryColor,
            spacing: 17.w,
            dotWidth: 12.w,
            dotHeight: 12.h),
      ),
    );
  }
}
