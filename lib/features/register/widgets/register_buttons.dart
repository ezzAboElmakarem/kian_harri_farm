import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/features/home/views/home_view.dart';
import 'package:kian_sheeps_projects/features/register/bloc/register_bloc.dart';
import 'package:kian_sheeps_projects/helper/navigation_methods.dart';
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
          buttonText: 'تسجيل الدخول',
          textColor: Colors.white,
          onTap: () {
            if (bloc.formkey.currentState!.validate()) {
              bloc.add(Click());
            }
          },
        ),
        SizedBox(
          height: 15.h,
        ),
        QuestionAndButton(
            text: 'تسجيل الدخول', questionText: 'لديك حساب ؟', onTap: () {}),
        SizedBox(
          height: 15.h,
        ),
        CustomTextButton(
          text: 'التصفح بدون تسجيل دخول',
          onTap: () {
            navigateTo(context: context, widget: HomeView());
          },
        ),
        SizedBox(
          height: 25.h,
        ),
      ],
    );
  }
}
