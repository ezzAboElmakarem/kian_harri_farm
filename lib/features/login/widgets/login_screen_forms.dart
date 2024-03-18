import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/widgets/custom_tex_form_field.dart';

class LoginScreenForms extends StatefulWidget {
  const LoginScreenForms({super.key});

  @override
  State<LoginScreenForms> createState() => _LoginScreenFormsState();
}

class _LoginScreenFormsState extends State<LoginScreenForms> {
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextFormField(
          isEnabled: true,
          title: 'رقم الجوال / البريد الالكتروني',
          type: TextInputType.emailAddress,
          ispassword: false,
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomTextFormField(
          isEnabled: true,
          type: TextInputType.visiblePassword,
          title: 'كلمة المرور',
          ispassword: isPassword,
          prefixIcon: IconButton(
            onPressed: () {
              setState(() {
                isPassword = !isPassword;
              });
            },
            icon: Icon(isPassword ? Icons.visibility_off : Icons.visibility),
          ),
        ),
      ],
    );
  }
}
