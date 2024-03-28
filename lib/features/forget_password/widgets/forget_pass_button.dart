import 'package:flutter/material.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/features/forget_password/bloc/forget_password_bloc.dart';
import 'package:kian_sheeps_projects/features/verify_code/views/vrefiy_code_view.dart';
import 'package:kian_sheeps_projects/widgets/custom_button.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var bloc = ForgetPasswordBLoc.get(context);

    return CustomButton(
      buttonText: 'ارسال الكود',
      onTap: () {
        if (bloc.formkey.currentState!.validate()) {
          bloc.add(Click());
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const VerfiyCodeScreenView(),
            ),
          );
        }
      },
      textColor: null,
    );
  }
}
