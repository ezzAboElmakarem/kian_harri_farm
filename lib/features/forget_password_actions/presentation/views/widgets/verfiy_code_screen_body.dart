import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/utlis/component.dart';
import 'package:kian_sheeps_projects/core/widgets/asking_for_login_or_sgin_up_.dart';
import 'package:kian_sheeps_projects/core/widgets/password_image_&_title.dart';
import 'package:kian_sheeps_projects/features/forget_password_actions/presentation/views/widgets/pin_code_widget.dart';
import 'package:kian_sheeps_projects/features/forget_password_actions/presentation/views/reset_password_screen_view.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerfiyCodeScreenBody extends StatefulWidget {
  const VerfiyCodeScreenBody({super.key});

  @override
  State<VerfiyCodeScreenBody> createState() => _VerfiyCodeScreenBodyState();
}

class _VerfiyCodeScreenBodyState extends State<VerfiyCodeScreenBody> {
  TextEditingController textEditingController = TextEditingController();

  late StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 80.h),
            child: Column(
              children: [
                const PasswordImageAndTitle(
                    textBody:
                        'قم بإدخال رمز مكون من 4 ارقام تم ارساله الى رقم جوالك لإعادة تغيير كلمة المرور'),
                SizedBox(
                  height: 40.h,
                ),
                const CustomAppPinCodeField(),
                /*
                PinCodeTextField(
                  keyboardType: TextInputType.number,
                  errorTextDirection: TextDirection.rtl,
                  errorTextSpace: 25,
                  validator: (v) {
                    if (v!.length < 4) {
                      return "من فضلك أدخل الكود";
                    } else {
                      return null;
                    }
                  },
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 70.h,
                    fieldWidth: 68.w,
                    activeFillColor: Colors.white,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  // backgroundColor: Colors.blue.shade50,
                  //  enableActiveFill: true,
                  errorAnimationController: errorController,
                  controller: textEditingController,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      currentText = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                  appContext: context,
                ),
              */
                SizedBox(
                  height: 40.h,
                ),
                CustomButton(
                  buttonText: 'متابعة',
                  textColor: null,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      navigateTo(
                        context: context,
                        widget: const ResetPasswordScreenView(),
                      );
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                      return;
                    }
                  },
                ),
                SizedBox(
                  height: 40.h,
                ),
                AskingForLoginOrSignUp(
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
