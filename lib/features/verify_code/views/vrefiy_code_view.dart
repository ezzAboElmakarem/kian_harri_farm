import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/verify_code/verify_code_bloc/verify_code_bloc.dart';
import 'package:kian_sheeps_projects/features/verify_code/widgets/continue_button.dart';
import 'package:kian_sheeps_projects/features/verify_code/widgets/resend_code_widget.dart';
import '../widgets/pin_code_widget.dart';
import '../../../widgets/background_decoration.dart';
import '../../../widgets/password_image_and_title.dart';
import '../../../widgets/question_and_button.dart';

class VerfiyCodeScreenView extends StatefulWidget {
  final bool? isVerified;
  const VerfiyCodeScreenView({super.key, this.isVerified = false});

  @override
  State<VerfiyCodeScreenView> createState() => _VerfiyCodeScreenViewState();
}

class _VerfiyCodeScreenViewState extends State<VerfiyCodeScreenView> {
  @override
  void initState() {
    if (widget.isVerified ?? false) {
      final bloc = VerifyCodeBLoc.get(context);
      bloc.add(ResendCode());
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBackGround(
        child: BlocProvider(
          create: (context) => VerifyCodeBLoc(),
          child: BlocListener<VerifyCodeBLoc, AppState>(
            listener: (context, state) {
              if (state is Done) {
                BlocProvider.of<VerifyCodeBLoc>(context).add(Reset());
              }
            },
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
                      ContinueButton(isVerified: widget.isVerified),
                      SizedBox(
                        height: 20.h,
                      ),
                      QuestionAndButton(
                        text: "resend_code".tr(),
                        questionText: "don't_receive_code".tr(),
                        onTap: () {},
                      ),
                      const ResendWidget(),
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
