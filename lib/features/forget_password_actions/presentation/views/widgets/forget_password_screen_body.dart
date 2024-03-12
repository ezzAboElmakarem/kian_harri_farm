import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/utlis/component.dart';
import 'package:kian_sheeps_projects/features/forget_password_actions/presentation/views/vrefiy_code_view.dart';
import 'package:kian_sheeps_projects/core/widgets/password_image_&_title.dart';

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
                CustomTextFormFieldWithTitle(
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
                ),
                SizedBox(
                  height: 40.h,
                ),
                CustomButton(
                  buttonText: 'ارسال الكود',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      navigateTo(
                          context: context,
                          widget: const VerfiyCodeScreenView());
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
