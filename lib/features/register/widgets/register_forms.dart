import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/widgets/custom_tex_form_field.dart';

class RegisterForms extends StatefulWidget {
  const RegisterForms({super.key});

  @override
  State<RegisterForms> createState() => _RegisterFormsState();
}

class _RegisterFormsState extends State<RegisterForms> {
  bool isPassword = true;
  bool isConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          type: TextInputType.name,
          title: "الاسم",
          ispassword: false,
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomTextFormField(
          type: TextInputType.phone,
          title: 'رقم الجوال',
          ispassword: false,
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomTextFormField(
          type: TextInputType.emailAddress,
          title: "البريد الالكترونى",
          ispassword: false,
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomTextFormField(
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
        SizedBox(
          height: 10.h,
        ),
        CustomTextFormField(
          title: 'تأكيد كلمة المرور',
          type: TextInputType.visiblePassword,
          ispassword: isConfirmPassword,
          prefixIcon: IconButton(
            onPressed: () {
              setState(() {
                isConfirmPassword = !isConfirmPassword;
              });
            },
            icon: Icon(
                isConfirmPassword ? Icons.visibility_off : Icons.visibility),
          ),
        ),
      ],
    );
  }
}