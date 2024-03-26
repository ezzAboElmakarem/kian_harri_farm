import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/reset_password_body_text.dart';
import '../widgets/reset_password_screen_body.dart';
import '../../../widgets/background_decoration.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/logo_and_screen_title.dart';

class ResetPasswordScreenView extends StatelessWidget {
  const ResetPasswordScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBackGround(
        child: Center(
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
      ),
    );
  }
}
