import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/features/home/views/home_view.dart';
import 'package:kian_sheeps_projects/features/login/views/login_screen_view.dart';
import 'package:kian_sheeps_projects/features/register/bloc/register_bloc.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:kian_sheeps_projects/widgets/custom_button.dart';
import 'package:kian_sheeps_projects/widgets/custom_text_button.dart';
import 'package:kian_sheeps_projects/widgets/question_and_button.dart';

class RegisterButtons extends StatelessWidget {
  const RegisterButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var bloc = RegisterBloc.get(context);

    return Column(
      children: [
        CustomButton(
          buttonText: "login_button".tr(),
          textColor: Colors.white,
          onTap: () {
            if (bloc.formkey.currentState!.validate()) {
              bloc.add(Click());
              RouteUtils.navigateAndPopAll(HomeView());
            }
          },
        ),
        SizedBox(
          height: 15.h,
        ),
        QuestionAndButton(
            text: "login_button".tr(),
            questionText: "have_account".tr(),
            onTap: () {
              RouteUtils.navigateAndPopAll(const LoginScreenView());
            }),
        SizedBox(
          height: 15.h,
        ),
        CustomTextButton(
          text: "vistor_button".tr(),
          onTap: () {
            RouteUtils.navigateAndPopAll(HomeView());
          },
        ),
        SizedBox(
          height: 25.h,
        ),
      ],
    );
  }
}
