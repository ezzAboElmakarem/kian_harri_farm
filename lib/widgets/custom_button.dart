import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.textColor,
    required this.onTap,
  });
  final String buttonText;
  final Color? textColor;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 66.h,
        width: 327.w,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          //     border: Border.all(color: ColorStyles.greyColor),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyles.textstyle14
                .copyWith(color: textColor ?? Colors.white),
          ),
        ),
      ),
    );
  }
}
