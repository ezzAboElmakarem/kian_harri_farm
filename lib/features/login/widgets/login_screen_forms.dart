import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/widgets/custom_tex_form_field.dart';

class LoginScreenForms extends StatelessWidget {
  const LoginScreenForms({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextFormField(
          title: 'رقم الجوال / البريد الالكتروني',
          type: TextInputType.emailAddress,
          ispassword: false,
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomTextFormField(
          ispassword: true,
          type: TextInputType.visiblePassword,
          title: 'كلمة المرور',
        ),
      ],
    );
  }
}
