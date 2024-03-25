import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/is_arabic_method.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
      this.controller,
      this.type,
      this.hint,
      this.title,
      this.fillColor,
      this.textAlign,
      // required this.textDirection,
      this.prefixIcon,
      this.prefixText,
      this.suffixIcon,
      this.onChange,
      this.errorColor,
      this.hintColor,
      this.borderColor,
      this.validation,
      required this.ispassword,
      required this.isEnabled,
      this.maxLines});
  TextEditingController? controller;
  TextInputType? type;
  String? hint;
  final String? title;
  Color? titleColor = Colors.black;
  Color? fillColor = const Color(0xffEFEFEF);
  TextDirection? textDirection;
  Widget? prefixIcon;
  String? prefixText;
  Widget? suffixIcon;
  Function(String)? onChange;
  Color? errorColor;
  bool ispassword;
  bool isEnabled;
  String? Function(String?)? validation;
  int? maxLines;
  Color? hintColor;
  Color? borderColor;
  TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          //textdirection: isArabic() ? TextDirection.rtl : TextDirection.ltr,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Text(title ?? '',
                  style: TextStyles.textstyle16.copyWith(
                      color: titleColor, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        TextFormField(
          textAlign: textAlign ?? TextAlign.start,
          enabled: isEnabled,
          maxLines: maxLines ?? 1,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontSize: 14.sp),
          //textdirection: isArabic() ? TextDirection.rtl : TextDirection.ltr,
          obscureText: ispassword,
          onChanged: onChange,
          controller: controller,
          validator: validation,
          keyboardType: type,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 10.w, vertical: 17.h),
            //  contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
            errorStyle: TextStyle(
                color: errorColor, fontSize: 14, fontWeight: FontWeight.bold),
            hintStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: hintColor ?? ColorStyles.textGreyColor.withOpacity(0.4),
            ),
            hintTextDirection:
                isArabic() ? TextDirection.rtl : TextDirection.ltr,
            prefixText: prefixText,
            prefixStyle: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold),
            filled: true,
            fillColor: fillColor ?? const Color(0xffEFEFEF),
            hintText: hint,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor ?? const Color(0xffEFEFEF),
                width: 2.w,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor ?? const Color(0xffEFEFEF),
                width: 2.w,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor ?? const Color(0xffEFEFEF),
                width: 2,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor ?? const Color(0xffEFEFEF),
                width: 2,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
