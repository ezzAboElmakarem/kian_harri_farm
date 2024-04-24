import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/login/bloc/login_bloc.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import '../../home/views/home_view.dart';
import '../widgets/forget_password_button.dart';
import '../widgets/login_button.dart';
import '../widgets/login_screen_forms.dart';
import '../../register/views/register_view.dart';
import '../../../widgets/background_decoration.dart';
import '../../../widgets/logo_and_screen_title.dart';
import '../../../widgets/question_and_button.dart';
import '../../../widgets/visitor_button.dart';

class LoginScreenView extends StatelessWidget {
  const LoginScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBackGround(
        child: BlocProvider(
          create: (_) => LoginBloc(),
          child: BlocListener<LoginBloc, AppState>(
            listener: (context, state) {
              if (state is Done) {
                BlocProvider.of<LoginBloc>(context).add(Reset());
              }
            },
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LogoAndScreenTitle(screenTitle: "login".tr()),
                      SizedBox(height: 30.h),
                      const LoginScreenForms(),
                      SizedBox(height: 10.h),
                      const ForgetPasswordTextButton(),
                      SizedBox(height: 15.h),
                      const LoginButton(),
                      SizedBox(height: 56.h),
                      QuestionAndButton(
                        text: "create_new_account".tr(),
                        questionText: "dont_have_account".tr(),
                        onTap: () {
                          RouteUtils.navigateAndPopAll(const RegisterView());
                        },
                      ),
                      SizedBox(height: 15.h),
                      VisitorButton(onTap: () {
                        RouteUtils.navigateAndPopAll(HomeView());
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
