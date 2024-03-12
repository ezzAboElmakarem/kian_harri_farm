import 'package:flutter/material.dart';
import 'package:kian_sheeps_projects/core/utlis/component.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      buttonText: 'تسجيل الدخول',
      textColor: Colors.white,
      onTap: onTap,
    );
  }
}
