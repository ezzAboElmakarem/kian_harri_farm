import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/login/presentation/views/login_screen_view.dart';
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
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomTextButton(
            textColor: Colors.black,
            text: 'تخطى',
            onTap: () {
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
