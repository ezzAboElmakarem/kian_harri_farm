import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../helper/color_styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductSlider extends StatefulWidget {
  const ProductSlider({
    super.key,
    required this.imageViewPoint,
    this.list,
  });
  final double imageViewPoint;
  final List<Widget>? list;
  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Column(
        children: [
          CarouselSlider(
            items: widget.list,
            options: CarouselOptions(
              height: 148.h,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: widget.imageViewPoint,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },

              //ssenlargeCenterPage: true,
              //enlargeStrategy: CenterPageEnlargeStrategy.height
            ),
          ),
          SizedBox(height: 14.h),
          AnimatedSmoothIndicator(
            activeIndex: currentIndex,
            count: widget.list?.length ?? 0,
            effect: ExpandingDotsEffect(
              dotColor: Colors.grey,
              activeDotColor: kPrimaryColor,
              spacing: 8.w,
              dotWidth: 12.w,
              dotHeight: 8.h,
            ),
          ),
        ],
      ),
    );
  }
}
