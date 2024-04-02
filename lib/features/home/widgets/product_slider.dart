import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/home/bloc/home_bloc.dart';
import 'package:kian_sheeps_projects/widgets/product_slider_image.dart';
import '../../../helper/color_styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductSlider extends StatefulWidget {
  const ProductSlider(
      {super.key, required this.imageViewPoint, required this.imagesUrl});
  final double imageViewPoint;
  final List<Widget> imagesUrl;
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
      child: SizedBox(
        height: 220.h,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CarouselSlider(
              items: bloc.homeData.banner!.map((banner) {
                return AppTopViewedCard(imagePath: banner.image!);
              }).toList(),
              options: CarouselOptions(
                height: 300.h,
                autoPlay: true,
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
            Padding(
              padding: EdgeInsets.only(bottom: 8.0.h),
              child: AnimatedSmoothIndicator(
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
            ),
          ],
        ),
      ),
    );
  }
}
