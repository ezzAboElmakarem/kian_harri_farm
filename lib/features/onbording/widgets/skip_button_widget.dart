import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/login/views/login_screen_view.dart';
import 'package:kian_sheeps_projects/generated/l10n.dart';
import 'package:kian_sheeps_projects/helper/is_arabic_method.dart';
import 'package:kian_sheeps_projects/widgets/custom_text_button.dart';

class SkipButtonWidget extends StatelessWidget {
  const SkipButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 14.h),
      child: Row(
        mainAxisAlignment:
            isArabic() ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          CustomTextButton(
            textColor: Colors.black,
            text: S.of(context).skip,
            onTap: () {
              log('skip button clicked');
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const LoginScreenView(),
                ),
                (route) => false,
              );
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
