import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/constants.dart';
import 'package:kian_sheeps_projects/features/onbording_screen/data/onbording_model.dart';
import 'package:kian_sheeps_projects/features/onbording_screen/presentaion/views/widgets/bording_item.dart';
import 'package:kian_sheeps_projects/features/onbording_screen/presentaion/views/widgets/next_bording_button.dart';
import 'package:kian_sheeps_projects/features/onbording_screen/presentaion/views/widgets/skip_button_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBordingScreenBody extends StatefulWidget {
  const OnBordingScreenBody({super.key});

  @override
  State<OnBordingScreenBody> createState() => _OnBordingScreenBodyState();
}

class _OnBordingScreenBodyState extends State<OnBordingScreenBody> {
  var bordingController = PageController();
  bool isLastScreen = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background_image.png'),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const skipButtonWidget(),
                Expanded(
                  child: SizedBox(
                    child: PageView.builder(
                      controller: bordingController,
                      onPageChanged: (int index) {
                        if (index == onbordingItems.length - 1) {
                          setState(() {
                            isLastScreen = true;
                          });
                        } else {
                          setState(() {
                            isLastScreen = false;
                          });
                        }
                      },
                      itemCount: onbordingItems.length,
                      itemBuilder: (context, index) => buildBordingItem(
                        onbordingItems[index],
                      ),
                    ),
                  ),
                ),
                NextBordingButton(
                    isLastScreen: isLastScreen,
                    bordingController: bordingController),
              ],
            ),
          ),
          Positioned(
            left: 143.w,
            top: 580.h,
            child: SmoothPageIndicator(
              controller: bordingController,
              count: 3,
              effect: ScrollingDotsEffect(
                  activeDotColor: kPrimaryColor,
                  spacing: 17.w,
                  dotWidth: 12.w,
                  dotHeight: 12.h),
            ),
          ),
        ],
      ),
    );
  }
}
