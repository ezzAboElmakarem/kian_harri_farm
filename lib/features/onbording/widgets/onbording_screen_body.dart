import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/onbording/widgets/smooth_indicator_widget.dart';
import 'package:kian_sheeps_projects/features/onbording/models/onbording_model.dart';
import 'package:kian_sheeps_projects/features/onbording/widgets/bording_item.dart';
import 'package:kian_sheeps_projects/features/onbording/widgets/next_bording_button.dart';
import 'package:kian_sheeps_projects/features/onbording/widgets/skip_button_widget.dart';

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
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SkipButtonWidget(),
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
        SmoothIndicatorWidget(bordingController: bordingController),
      ],
    );
  }
}
