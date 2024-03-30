import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import '../../login/views/login_screen_view.dart';
import '../../../widgets/custom_text_button.dart';

class SkipButtonWidget extends StatelessWidget {
  const SkipButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 14.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomTextButton(
            textColor: Colors.black,
            text: "skip".tr(),
            onTap: () {
              log('skip button clicked');
              RouteUtils.navigateAndPopAll(const LoginScreenView());
            },
          ),
        ],
      ),
    );
    // TextButton(
    //   onPressed: () {
    //     Navigator.of(context).pushAndRemoveUntil(
    //       MaterialPageRoute(
    //         builder: (context) => const LoginScreenView(),
    //       ),
    //       (route) => false,
    //     );
    //     // RouteUtils.navigateTo(const LoginScreenView());
    //   },
    //   child: Align(
    //     alignment: Alignment.topRight,
    //     child: Text(
    //       'تخطى',
    //       style: Styles.textstyle16.copyWith(fontWeight: FontWeight.bold),
    //     ),
    //   ),
    // );
  }
}
