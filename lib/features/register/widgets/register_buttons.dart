import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/home/views/home_view.dart';
import 'package:kian_sheeps_projects/features/login/views/login_screen_view.dart';
import 'package:kian_sheeps_projects/features/register/bloc/register_bloc.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
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
        BlocBuilder<RegisterBloc, AppState>(
          builder: (context, state) {
            if (state is Loading) {
              return const Center(
                child: CircularProgressIndicator(color: kPrimaryColor),
              );
            } else if (state is Error) {
              return CustomButton(
                buttonText: "login_button".tr(),
                textColor: Colors.white,
                onTap: () {
                  bloc.add(Click());
                },
              );
            } else {
              return CustomButton(
                buttonText: "login_button".tr(),
                textColor: Colors.white,
                onTap: () {
                  bloc.add(Click());
                },
              );
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
