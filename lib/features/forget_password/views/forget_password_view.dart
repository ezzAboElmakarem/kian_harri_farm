import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../password_verification/views/vrefiy_code_view.dart';
import '../../../widgets/background_decoration.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_tex_form_field.dart';
import '../../../widgets/password_image_and_title.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBackGround(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  left: 24.w, right: 24.w, top: 80.h, bottom: 30.h),
              child: Column(
                children: [
                  const PasswordImageAndTitle(
                    textBody:
                        'من فضلك قم بإدخال رقم جوالك لارسال كود مكون من4 أرقام لإعادة ضبط كلمة المرور الخاصة بك',
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomTextFormField(
                    isEnabled: true,
                    type: TextInputType.emailAddress,
                    title: 'رقم الجوال / البريد الالكتروني',
                    ispassword: false,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomButton(
                    buttonText: 'ارسال الكود',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const VerfiyCodeScreenView(),
                        ),
                      );
                    },
                    textColor: null,
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
