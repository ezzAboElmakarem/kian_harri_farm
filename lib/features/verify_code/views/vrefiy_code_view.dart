import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:kian_sheeps_projects/helper/show_snack_bar.dart';
import '../verify_code_bloc/verify_code_bloc.dart';
import '../widgets/pin_code_widget.dart';
import '../../reset_password/views/reset_password_screen_view.dart';
import '../../../widgets/background_decoration.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/password_image_and_title.dart';
import '../../../widgets/question_and_button.dart';

class VerfiyCodeScreenView extends StatelessWidget {
  const VerfiyCodeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = VerifyCodeBLoc.get(context);

    return BlocListener<VerifyCodeBLoc, AppState>(
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
                padding: EdgeInsets.only(
                    left: 24.w, right: 24.w, top: 80.h, bottom: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PasswordImageAndTitle(
                        textBody: "verification_body_text".tr()),
                    SizedBox(
                      height: 40.h,
                    ),
                    const CustomAppPinCodeField(),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomButton(
                      buttonText: "continue".tr(),
                      textColor: null,
                      onTap: () {
                        if (bloc.formkey.currentState!.validate()) {
                          bloc.add(Click());
                          RouteUtils.navigateAndPopAll(
                              const ResetPasswordScreenView());
                        }
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    QuestionAndButton(
                      text: "resend_code".tr(),
                      questionText: "don't_receive_code".tr(),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
