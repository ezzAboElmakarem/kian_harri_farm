import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/home/bloc/home_bloc.dart';
import 'package:kian_sheeps_projects/widgets/product_slider_image.dart';
import '../../../helper/color_styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductSlider extends StatefulWidget {
  const ProductSlider({
    super.key,
    required this.imageViewPoint,
  });
  final double imageViewPoint;
  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var bloc = HomeBloc.get(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Column(
        children: [
          CarouselSlider(
            items: bloc.homeData.banner!.map((banner) {
              return AppTopViewedCard(imagePath: banner.image!);
            }).toList(),
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
            count: bloc.homeData.banner!.length,
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
