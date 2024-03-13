import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/password_verification/widgets/pin_code_widget.dart';
import 'package:kian_sheeps_projects/features/reset_password/views/reset_password_screen_view.dart';
import 'package:kian_sheeps_projects/widgets/background_decoration.dart';
import 'package:kian_sheeps_projects/widgets/custom_button.dart';
import 'package:kian_sheeps_projects/widgets/password_image_&_title.dart';
import 'package:kian_sheeps_projects/widgets/question_and_button.dart';

class VerfiyCodeScreenView extends StatelessWidget {
  const VerfiyCodeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBackGround(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  left: 24.w, right: 24.w, top: 80.h, bottom: 20.h),
              child: Column(
                children: [
                  const PasswordImageAndTitle(
                      textBody:
                          'قم بإدخال رمز مكون من 4 ارقام تم ارساله الى رقم جوالك لإعادة تغيير كلمة المرور'),
                  SizedBox(
                    height: 40.h,
                  ),
                  const CustomAppPinCodeField(),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomButton(
                    buttonText: 'متابعة',
                    textColor: null,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ResetPasswordScreenView(),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  QuestionAndButton(
                    text: 'عادة الارسال ',
                    questionText: 'لم تستلم الرسالة؟',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
