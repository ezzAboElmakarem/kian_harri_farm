import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/reset_password/bloc/reset_pass_bloc.dart';
import 'package:kian_sheeps_projects/features/reset_password/widgets/confirm_password.dart';
import '../widgets/reset_password_body_text.dart';
import '../widgets/reset_password_screen_body.dart';
import '../../../widgets/background_decoration.dart';
import '../../../widgets/logo_and_screen_title.dart';

class ResetPasswordScreenView extends StatelessWidget {
  const ResetPasswordScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBackGround(
        child: BlocProvider(
          create: (context) => ResetPasswordBLoc(),
          child: BlocListener<ResetPasswordBLoc, AppState>(
            listener: (context, state) {
              if (state is Done) {
                BlocProvider.of<ResetPasswordBLoc>(context).add(Reset());
              }
            },
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
                  const ConfirmPassword(),
                  SizedBox(
                    height: 40.h,
                  ),
                ],
              ),
            ))),
          ),
        ),
      ),
    );
  }
}
