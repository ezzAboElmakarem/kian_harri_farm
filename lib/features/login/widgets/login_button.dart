import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../widgets/custom_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      buttonText: "login_button".tr(),
      textColor: Colors.white,
      onTap: onTap,
    );
  }
}
