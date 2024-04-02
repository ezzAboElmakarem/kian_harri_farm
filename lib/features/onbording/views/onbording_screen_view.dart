import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/AppStorage.dart';
import '../models/onbording_model.dart';
import '../widgets/bording_item.dart';
import '../widgets/next_bording_button.dart';
import '../widgets/skip_button_widget.dart';
import '../widgets/smooth_indicator_widget.dart';
import '../../../widgets/background_decoration.dart';

class OnBordingScreenView extends StatefulWidget {
  const OnBordingScreenView({super.key});

  @override
  State<OnBordingScreenView> createState() => _OnBordingScreenViewState();
}

class _OnBordingScreenViewState extends State<OnBordingScreenView> {
  var bordingController = PageController();
  bool isLastScreen = false;
  @override
  void initState() {
    AppStorage.cacheOnBoarding(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DecoratedBackGround(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 8.h),
                const SkipButtonWidget(),
                // SizedBox(height: 40.h),
                Expanded(
                  child: SizedBox(
                    child: PageView.builder(
                      reverse: true,
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
                // SizedBox(height: 24.h),
                SmoothIndicatorWidget(bordingController: bordingController),
                SizedBox(height: 48.h),

                NextBordingButton(
                    isLastScreen: isLastScreen,
                    bordingController: bordingController),
              ],
            ),
          ),
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
