import 'package:flutter/material.dart';
import 'package:kian_sheeps_projects/helper/constants.dart';
import 'package:kian_sheeps_projects/helper/styles.dart';

class VisitorButton extends StatelessWidget {
  const VisitorButton({
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
