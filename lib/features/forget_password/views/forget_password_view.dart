import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/forget_password/widgets/forget_pass_button.dart';
import 'package:kian_sheeps_projects/features/forget_password/widgets/forget_pass_form.dart';
import '../../../widgets/background_decoration.dart';
import '../../../widgets/password_image_and_title.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBackGround(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  left: 24.w, right: 24.w, top: 80.h, bottom: 30.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PasswordImageAndTitle(
                    textBody: 'forget_password_body_text'.tr(),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  const ForgetPasswordForm(),
                  SizedBox(
                    height: 40.h,
                  ),
                  const ForgetPasswordButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
