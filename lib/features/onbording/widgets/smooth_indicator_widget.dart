import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../helper/color_styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothIndicatorWidget extends StatelessWidget {
  const SmoothIndicatorWidget({
    super.key,
    required this.bordingController,
  });

  final PageController bordingController;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: bordingController,
      textDirection: TextDirection.ltr,
      count: 3,
      effect: ScrollingDotsEffect(
          activeDotColor: kPrimaryColor,
          spacing: 17.w,
          dotWidth: 12.w,
          dotHeight: 12.h),
    );
  }
}
