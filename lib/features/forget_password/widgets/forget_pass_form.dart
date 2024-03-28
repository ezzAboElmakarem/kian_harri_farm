import 'package:flutter/material.dart';
import 'package:kian_sheeps_projects/features/forget_password/bloc/forget_password_bloc.dart';
import 'package:kian_sheeps_projects/helper/validations.dart';
import 'package:kian_sheeps_projects/widgets/custom_tex_form_field.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var bloc = ForgetPasswordBLoc.get(context);

    return Form(
      key: bloc.formkey,
      child: CustomTextFormField(
        isEnabled: true,
        type: TextInputType.emailAddress,
        controller: bloc.emailOrPhone,
        validation: Validator.empty,
        title: 'رقم الجوال / البريد الالكتروني',
        ispassword: false,
      ),
    );
  }
}
