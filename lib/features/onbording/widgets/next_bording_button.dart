import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import '../../login/views/login_screen_view.dart';
import '../../../widgets/custom_button.dart';

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
        buttonText: "next".tr(),
        textColor: Colors.white,
        onTap: () {
          if (isLastScreen == true) {
            RouteUtils.navigateAndPopAll(const LoginScreenView());
          } else {
            bordingController.nextPage(
                duration: const Duration(milliseconds: 700),
                curve: Curves.fastLinearToSlowEaseIn);
          }
        });
  }
}
