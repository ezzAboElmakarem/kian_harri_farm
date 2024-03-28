import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/login/bloc/login_bloc.dart';
import 'package:kian_sheeps_projects/helper/validations.dart';
import '../../../widgets/custom_tex_form_field.dart';

class LoginScreenForms extends StatefulWidget {
  const LoginScreenForms({super.key});

  @override
  State<LoginScreenForms> createState() => _LoginScreenFormsState();
}

class _LoginScreenFormsState extends State<LoginScreenForms> {
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    var bloc = LoginBloc.get(context);
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

    return Form(
      autovalidateMode: autovalidateMode,
      key: bloc.formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormField(
            isEnabled: true,
            title: "email_or_phone".tr(),
            type: TextInputType.emailAddress,
            controller: bloc.emailOrPhone,
            validation: Validator.empty,
            ispassword: false,
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomTextFormField(
            isEnabled: true,
            type: TextInputType.visiblePassword,
            title: "password".tr(),
            controller: bloc.password,
            validation: Validator.password,
            ispassword: isPassword,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isPassword = !isPassword;
                });
              },
              icon: Icon(isPassword ? Icons.visibility_off : Icons.visibility),
            ),
          ),
        ],
      ),
    );
  }
}
