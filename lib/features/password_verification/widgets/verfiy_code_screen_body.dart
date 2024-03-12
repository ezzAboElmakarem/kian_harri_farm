import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/widgets/question_and_button.dart';
import 'package:kian_sheeps_projects/widgets/custom_button.dart';
import 'package:kian_sheeps_projects/widgets/password_image_&_title.dart';
import 'package:kian_sheeps_projects/features/password_verification/widgets/pin_code_widget.dart';
import 'package:kian_sheeps_projects/features/reset_password/views/reset_password_screen_view.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerfiyCodeScreenBody extends StatefulWidget {
  const VerfiyCodeScreenBody({super.key});

  @override
  State<VerfiyCodeScreenBody> createState() => _VerfiyCodeScreenBodyState();
}

class _VerfiyCodeScreenBodyState extends State<VerfiyCodeScreenBody> {
  TextEditingController textEditingController = TextEditingController();

  late StreamController<ErrorAnimationType> errorController;

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: 24.w, right: 24.w, top: 80.h, bottom: 12.h),
            child: Column(
              children: [
                const PasswordImageAndTitle(
                    textBody:
                        'قم بإدخال رمز مكون من 4 ارقام تم ارساله الى رقم جوالك لإعادة تغيير كلمة المرور'),
                SizedBox(
                  height: 40.h,
                ),
                const CustomAppPinCodeField(),
                SizedBox(
                  height: 20.h,
                ),
                CustomButton(
                  buttonText: 'متابعة',
                  textColor: null,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ResetPasswordScreenView(),
                        ),
                      );

                      // RouteUtils.navigateTo(const ResetPasswordScreenView());
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                      return;
                    }
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                QuestionAndButton(
                  text: 'عادة الارسال ',
                  questionText: 'لم تستلم الرسالة؟',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
