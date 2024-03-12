import 'package:flutter/material.dart';
import 'package:kian_sheeps_projects/constants.dart';
import 'package:kian_sheeps_projects/core/utlis/styles.dart';

class CheckAppWithoutLoginButton extends StatelessWidget {
  const CheckAppWithoutLoginButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text('التصفح بدون تسجيل دخول',
          style: Styles.textstyle16.copyWith(color: kPrimaryColor)),
    );
  }
}
