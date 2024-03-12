import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/forget_password/views/forget_password_view.dart';
import 'package:kian_sheeps_projects/widgets/custom_text_button.dart';

class ForgetPasswordTextButton extends StatelessWidget {
  const ForgetPasswordTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextButton(
            text: 'نسيت كلمة المرور؟',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ForgetPasswordView(),
                ),
              );

              // RouteUtils.navigateTo(const ForgetPasswordView());
            },
          ),
        ],
      ),
    );
    /*
    Align(
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ForgetPasswordView(),
            ),
          );

          // RouteUtils.navigateTo(const ForgetPasswordView());
        },
        child: Text('نسيت كلمة المرور؟',
            style: Styles.textstyle16.copyWith(color: kPrimaryColor)),
      ),
    );
*/
  }
}
