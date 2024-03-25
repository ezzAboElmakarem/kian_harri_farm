import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/home/views/home_view.dart';
import 'package:kian_sheeps_projects/features/login/widgets/forget_password_button.dart';
import 'package:kian_sheeps_projects/features/login/widgets/login_button.dart';
import 'package:kian_sheeps_projects/features/login/widgets/login_screen_forms.dart';
import 'package:kian_sheeps_projects/features/register/views/register_view.dart';
import 'package:kian_sheeps_projects/generated/l10n.dart';
import 'package:kian_sheeps_projects/helper/is_arabic_method.dart';
import 'package:kian_sheeps_projects/widgets/background_decoration.dart';
import 'package:kian_sheeps_projects/widgets/logo_and_screen_title.dart';
import 'package:kian_sheeps_projects/widgets/question_and_button.dart';
import 'package:kian_sheeps_projects/widgets/visitor_button.dart';

class LoginScreenView extends StatelessWidget {
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBackGround(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LogoAndScreenTitle(screenTitle: S.of(context).login),
                  SizedBox(
                    height: 30.h,
                  ),
                  const LoginScreenForms(),
                  SizedBox(
                    height: 10.h,
                  ),
                  const ForgetPasswordTextButton(),
                  SizedBox(
                    height: 15.h,
                  ),
                  LoginButton(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HomeView(),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 56.h,
                  ),
                  QuestionAndButton(
                    text: isArabic()
                        ? S.of(context).dont_have_account
                        : S.of(context).create_new_account,
                    questionText: isArabic()
                        ? S.of(context).create_new_account
                        : S.of(context).dont_have_account,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const RegisterView(),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  VisitorButton(onTap: () {}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
