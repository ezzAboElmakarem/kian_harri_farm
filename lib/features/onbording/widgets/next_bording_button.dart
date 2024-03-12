import 'package:flutter/material.dart';
import 'package:kian_sheeps_projects/features/login/views/login_screen_view.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:kian_sheeps_projects/widgets/custom_button.dart';

class NextBordingButton extends StatelessWidget {
  const NextBordingButton({
    super.key,
    required this.isLastScreen,
    required this.bordingController,
  });

  final bool isLastScreen;
  final PageController bordingController;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        buttonText: 'التالي',
        textColor: Colors.white,
        onTap: () {
          if (isLastScreen == true) {
            RouteUtils.navigateTo(const LoginScreenView());
          } else {
            bordingController.nextPage(
                duration: const Duration(milliseconds: 700),
                curve: Curves.fastLinearToSlowEaseIn);
          }
        });
  }
}
