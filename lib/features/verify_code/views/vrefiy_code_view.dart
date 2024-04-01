import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/verify_code/widgets/continue_button.dart';
import '../widgets/pin_code_widget.dart';
import '../../../widgets/background_decoration.dart';
import '../../../widgets/password_image_and_title.dart';
import '../../../widgets/question_and_button.dart';

class VerfiyCodeScreenView extends StatelessWidget {
  final bool? isRegister;
  const VerfiyCodeScreenView({super.key, this.isRegister = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  ContinueButton(isRegister: isRegister),
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
    );
  }
}
