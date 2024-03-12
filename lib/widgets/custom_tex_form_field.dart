import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    required this.type,
    this.hint,
    required this.title,
    required this.textDirection,
    this.prefixIcon,
    this.prefixText,
    this.suffixIcon,
    this.onChange,
    this.errorColor,
    required this.validation,
    required this.ispassword,
    required this.isEnabled,
  });
  final TextEditingController? controller;
  final TextInputType? type;
  final String? hint;
  final String? title;
  final Color? titleColor = Colors.black;
  final textDirection;
  final Widget? prefixIcon;
  final String? prefixText;
  final Widget? suffixIcon;
  final Function(String)? onChange;
  final Color? errorColor;
  final bool ispassword;
  final bool isEnabled;
  final String? Function(String?)? validation;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          textDirection: TextDirection.rtl,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Text(title!,
                  style: Styles.textstyle16.copyWith(
                      color: titleColor, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        TextFormField(
          enabled: isEnabled,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: 16.sp),
          textDirection: textDirection,
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
            // hintStyle: TextStyle(
            //     fontSize: 16.sp,
            //     fontWeight: FontWeight.w400,
            //     color: ColorStyles.textFormFieldHintColor),
            hintTextDirection: TextDirection.rtl,
            prefixText: prefixText,
            prefixStyle: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold),
            filled: true,
            fillColor: const Color(0xffEFEFEF),
            hintText: hint,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: const Color(0xffEFEFEF),
                width: 2.w,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: const Color(0xffEFEFEF),
                width: 2.w,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffEFEFEF),
                width: 2,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffE7E7E7),
                width: 2,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
