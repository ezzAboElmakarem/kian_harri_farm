import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/register/bloc/register_bloc.dart';
import 'package:kian_sheeps_projects/helper/validations.dart';
import '../../../widgets/custom_tex_form_field.dart';

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
    var bloc = RegisterBloc.get(context);
    return Form(
      key: bloc.formkey,
      child: Column(
        children: [
          CustomTextFormField(
            isEnabled: true,
            type: TextInputType.name,
            title: "name".tr(),
            ispassword: false,
            controller: bloc.name,
            validation: Validator.name,
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomTextFormField(
            isEnabled: true,
            type: TextInputType.phone,
            title: 'phone'.tr(),
            ispassword: false,
            controller: bloc.phone,
            validation: Validator.phone,
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomTextFormField(
            isEnabled: true,
            type: TextInputType.emailAddress,
            title: 'email'.tr(),
            ispassword: false,
            controller: bloc.email,
            validation: Validator.email,
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomTextFormField(
            isEnabled: true,
            type: TextInputType.visiblePassword,
            title: 'password'.tr(),
            ispassword: isPassword,
            controller: bloc.password,
            validation: Validator.password,
            suffixIcon: IconButton(
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
            title: 'confirm_password'.tr(),
            type: TextInputType.visiblePassword,
            ispassword: isConfirmPassword,
            controller: bloc.passwordConfirmation,
            validation: (value) {
              if (value != bloc.password.value.text) {
                return 'password_dose_not_match';
              }
              return null;
            },
            suffixIcon: IconButton(
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
      ),
    );
  }
}
