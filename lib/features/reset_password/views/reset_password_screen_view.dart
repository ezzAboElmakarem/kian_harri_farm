import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/reset_password/widgets/reset_password_body_text.dart';
import 'package:kian_sheeps_projects/features/reset_password/widgets/reset_password_screen_body.dart';
import 'package:kian_sheeps_projects/widgets/custom_button.dart';
import 'package:kian_sheeps_projects/widgets/logo_and_screen_title.dart';

class ResetPasswordScreenView extends StatelessWidget {
  const ResetPasswordScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
              child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
        ),
        child: Column(
          children: [
            const LogoAndScreenTitle(screenTitle: 'اعادة ضبط كلمة المرور'),
            SizedBox(
              height: 22.h,
            ),
            const ResetPasswordBodyText(),
            SizedBox(
              height: 40.h,
            ),
            const ResetPasswordForms(),
            SizedBox(
              height: 40.h,
            ),
            CustomButton(
              buttonText: 'تاكيد',
              textColor: null,
              onTap: () {},
            ),
            SizedBox(
              height: 40.h,
            ),
          ],
        ),
      ))),
    );
  }
}
