import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductSlider extends StatefulWidget {
  ProductSlider({super.key});

  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  int currentIndex = 0;

  final imagesUrl = [
    Image.asset(
      AssetsData.meatBigPic,
    ),
    Image.asset(AssetsData.meatBigPic),
    Image.asset(AssetsData.meatBigPic),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: SizedBox(
        height: 220.h,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CarouselSlider(
              items: imagesUrl,
              options: CarouselOptions(
                height: 300.h,
                autoPlay: true,
                viewportFraction: 0.9,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },

                //ssenlargeCenterPage: true,
                //enlargeStrategy: CenterPageEnlargeStrategy.height
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0.h),
              child: AnimatedSmoothIndicator(
                activeIndex: currentIndex,
                count: imagesUrl.length,
                effect: ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  activeDotColor: kPrimaryColor,
                  spacing: 8.w,
                  dotWidth: 12.w,
                  dotHeight: 8.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
