import 'package:flutter/material.dart';
import 'package:kian_sheeps_projects/constants.dart';
import 'package:kian_sheeps_projects/core/utlis/component.dart';
import 'package:kian_sheeps_projects/core/utlis/styles.dart';
import 'package:kian_sheeps_projects/features/forget_password_actions/presentation/views/forget_password_view.dart';

class ForgetPasswordTextButton extends StatelessWidget {
  const ForgetPasswordTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: () {
          navigateTo(
            context: context,
            widget: const ForgetPasswordView(),
          );
        },
        child: Text('نسيت كلمة المرور؟',
            style: Styles.textstyle16.copyWith(color: kPrimaryColor)),
      ),
    );
  }
}
