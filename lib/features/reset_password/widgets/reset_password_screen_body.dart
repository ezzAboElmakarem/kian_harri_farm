import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/reset_password/bloc/reset_pass_bloc.dart';
import 'package:kian_sheeps_projects/helper/validations.dart';
import '../../../widgets/custom_tex_form_field.dart';

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
    var bloc = ResetPasswordBLoc.get(context);

    return Form(
      key: bloc.formkey,
      child: Column(
        children: [
          CustomTextFormField(
            isEnabled: true,
            ispassword: isPassword,
            type: TextInputType.visiblePassword,
            title: 'كلمة المرور الجديدة',
            errorColor: Colors.red,
            controller: bloc.password,
            validation: Validator.password,
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
            isEnabled: true,
            title: 'تأكيد كلمة المرور الجديدة',
            type: TextInputType.visiblePassword,
            ispassword: isPasswordConfirm,
            controller: bloc.confirmPassword,
            validation: (value) {
              final password = bloc.password.text;
              if (value == null || value.isEmpty) {
                return 'Please enter your password confirmation';
              }
              if (value != password) {
                return 'Passwords do not match';
              }
              return null;
            },
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
      ),
    );
  }
}
