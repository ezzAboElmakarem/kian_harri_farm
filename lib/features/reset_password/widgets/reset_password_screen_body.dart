import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/widgets/custom_tex_form_field.dart';

class ResetPasswordForms extends StatefulWidget {
  const ResetPasswordForms({super.key});

  @override
  State<ResetPasswordForms> createState() => _ResetPasswordFormsState();
}

class _ResetPasswordFormsState extends State<ResetPasswordForms> {
  bool isPassword = true;
  bool isPasswordConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          ispassword: isPassword,
          type: TextInputType.visiblePassword,
          title: 'كلمة المرور الجديدة',
          errorColor: Colors.red,
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
          title: 'تأكيد كلمة المرور الجديدة',
          type: TextInputType.visiblePassword,
          ispassword: isPasswordConfirm,
          prefixIcon: IconButton(
            onPressed: () {
              setState(() {
                isPasswordConfirm = !isPasswordConfirm;
              });
            },
            icon: Icon(
                isPasswordConfirm ? Icons.visibility_off : Icons.visibility),
          ),
          onChange: null,
        ),
      ],
    );
  }
}
