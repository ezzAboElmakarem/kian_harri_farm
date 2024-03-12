import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/password_verification/views/vrefiy_code_view.dart';
import 'package:kian_sheeps_projects/widgets/custom_button.dart';
import 'package:kian_sheeps_projects/widgets/custom_tex_form_field.dart';
import 'package:kian_sheeps_projects/widgets/password_image_&_title.dart';

class ForgetPasswordScreenBody extends StatefulWidget {
  const ForgetPasswordScreenBody({super.key});

  @override
  State<ForgetPasswordScreenBody> createState() =>
      _ForgetPasswordScreenBodyState();
}

class _ForgetPasswordScreenBodyState extends State<ForgetPasswordScreenBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  TextEditingController? phoneNumberOrEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
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
                  controller: phoneNumberOrEmailController,
                  type: TextInputType.emailAddress,
                  title: 'رقم الجوال / البريد الالكتروني',
                  textDirection: TextDirection.rtl,
                  onChange: (String val) {},
                  validation: (value) {
                    if (value!.isEmpty) {
                      return 'يجب ادخال البريد الالكتروني';
                    }
                    return null;
                  },
                  ispassword: false,
                  isEnabled: true,
                ),
                SizedBox(
                  height: 40.h,
                ),
                CustomButton(
                  buttonText: 'ارسال الكود',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const VerfiyCodeScreenView(),
                        ),
                      );

                      // RouteUtils.navigateTo(const VerfiyCodeScreenView());
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                      return;
                    }
                  },
                  textColor: null,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
