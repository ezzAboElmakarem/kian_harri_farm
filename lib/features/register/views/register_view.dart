import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/register/widgets/register_forms.dart';
import 'package:kian_sheeps_projects/features/register/widgets/accept_terms_widgets.dart';
import 'package:kian_sheeps_projects/widgets/background_decoration.dart';
import 'package:kian_sheeps_projects/widgets/custom_button.dart';
import 'package:kian_sheeps_projects/widgets/custom_text_button.dart';
import 'package:kian_sheeps_projects/widgets/logo_and_screen_title.dart';
import 'package:kian_sheeps_projects/widgets/question_and_button.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBackGround(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.h,
              ),
              child: Column(
                children: [
                  const LogoAndScreenTitle(
                    screenTitle: 'تسجيل جديد',
                  ),
                  const RegisterForms(),
                  SizedBox(
                    height: 24.h,
                  ),
                  const AcceptTermsWidget(),
                  SizedBox(
                    height: 45.h,
                  ),
                  CustomButton(
                    buttonText: 'تسجيل الدخول',
                    textColor: Colors.white,
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  QuestionAndButton(
                      text: 'تسجيل الدخول',
                      questionText: 'لديك حساب ؟',
                      onTap: () {}),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomTextButton(
                    text: 'التصفح بدون تسجيل دخول',
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 25.h,
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
