import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/utlis/component.dart';
import 'package:kian_sheeps_projects/core/widgets/asking_for_login_or_sgin_up_.dart';
import 'package:kian_sheeps_projects/core/widgets/password_image_&_title.dart';
import 'package:kian_sheeps_projects/features/forget_password_actions/presentation/views/reset_password_screen_view.dart';

class VerfiyCodeScreenBody extends StatelessWidget {
  const VerfiyCodeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 80.h),
          child: Column(
            children: [
              const PasswordImageAndTitle(
                  textBody:
                      'قم بإدخال رمز مكون من 4 ارقام تم ارساله الى رقم جوالك لإعادة تغيير كلمة المرور'),
              SizedBox(
                height: 40.h,
              ),
              //**********
              // pin code
              //****** */
              SizedBox(
                height: 40.h,
              ),

              CustomButton(
                buttonText: 'متابعة',
                textColor: null,
                onTap: () {
                  navigateTo(
                    context: context,
                    widget: const ResetPasswordScreenView(),
                  );
                },
              ),
              SizedBox(
                height: 40.h,
              ),
              AskingForLoginOrSignUp(
                text: 'عادة الارسال ',
                questionText: 'لم تستلم الرسالة؟',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
