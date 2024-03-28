import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/features/home/views/home_view.dart';
import 'package:kian_sheeps_projects/features/reset_password/bloc/reset_pass_bloc.dart';
import 'package:kian_sheeps_projects/helper/navigation_methods.dart';
import '../widgets/reset_password_body_text.dart';
import '../widgets/reset_password_screen_body.dart';
import '../../../widgets/background_decoration.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/logo_and_screen_title.dart';

class ResetPasswordScreenView extends StatelessWidget {
  const ResetPasswordScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = ResetPasswordBLoc.get(context);

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
                onTap: () {
                  if (bloc.formkey.currentState!.validate()) {
                    bloc.add(Click());
                    navigateTo(context: context, widget: HomeView());
                  }
                },
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
