import 'package:flutter/material.dart';
import 'package:kian_sheeps_projects/helper/constants.dart';
import 'package:kian_sheeps_projects/helper/styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onTap,
    this.textColor,
  });
  final String text;
  final VoidCallback onTap;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: Styles.textstyle16.copyWith(
            color: textColor ?? kPrimaryColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
