import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/onbording/models/onbording_model.dart';
import 'package:kian_sheeps_projects/features/onbording/widgets/bording_item.dart';
import 'package:kian_sheeps_projects/features/onbording/widgets/next_bording_button.dart';
import 'package:kian_sheeps_projects/features/onbording/widgets/skip_button_widget.dart';
import 'package:kian_sheeps_projects/features/onbording/widgets/smooth_indicator_widget.dart';
import 'package:kian_sheeps_projects/widgets/background_decoration.dart';

class OnBordingScreenView extends StatefulWidget {
  const OnBordingScreenView({super.key});

  @override
  State<OnBordingScreenView> createState() => _OnBordingScreenViewState();
}

class _OnBordingScreenViewState extends State<OnBordingScreenView> {
  var bordingController = PageController();
  bool isLastScreen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBackGround(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 8.h,
                  ),
/******************************************************************************* */
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
        ),
      ),
    );
  }
}


// class BordinPageView extends StatefulWidget {
//    BordinPageView({super.key, required this.isLastScreen, required this.bordingController});
//   bool isLastScreen;
//   final PageController bordingController;

//   @override
//   State<BordinPageView> createState() => _BordinPageViewState();
// }

// class _BordinPageViewState extends State<BordinPageView> {
//   @override
//   Widget build(BuildContext context) {
//     return   Expanded(
//                     child: SizedBox(
//                       child: PageView.builder(
//                         controller: widget.bordingController,
//                         onPageChanged: (int index) {
//                           if (index == onbordingItems.length - 1) {
//                             setState(() {
//                               var isLastScreen = true;
//                             });
//                           } else {
//                             setState(() {
//                               isLastScreen = false;
//                             });
//                           }
//                         },
//                         itemCount: onbordingItems.length,
//                         itemBuilder: (context, index) => buildBordingItem(
//                           onbordingItems[index],
//                         ),
//                       ),
//                     ),
//                   );
//   }
// }