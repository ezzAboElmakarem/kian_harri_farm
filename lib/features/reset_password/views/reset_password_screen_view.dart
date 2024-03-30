import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/home/views/home_view.dart';
import 'package:kian_sheeps_projects/features/reset_password/bloc/reset_pass_bloc.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:kian_sheeps_projects/helper/show_snack_bar.dart';
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

    return BlocListener<ResetPasswordBLoc, AppState>(
      listener: (context, state) {
        if (state is Error) {
          showSnackBar(context, "catch an error ==>${state.errorMsg}");
        }
      },
      child: Scaffold(
        body: DecoratedBackGround(
          child: Center(
              child: SingleChildScrollView(
                  child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LogoAndScreenTitle(screenTitle: "reset_password".tr()),
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
                  buttonText: "confirm".tr(),
                  textColor: null,
                  onTap: () {
                    if (bloc.formkey.currentState!.validate()) {
                      bloc.add(Click());
                      RouteUtils.navigateAndPopAll(HomeView());
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
      ),
    );
  }
}
