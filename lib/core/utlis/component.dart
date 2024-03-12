import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/constants.dart';
import 'package:kian_sheeps_projects/core/utlis/styles.dart';

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
        style: Styles.textstyle16.copyWith(color: textColor ?? kPrimaryColor),
      ),
    );
  }
}

void navigateTo({@required context, @required widget}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateandfinish({@required context, @required widget}) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (contex) => widget),
      (route) => false).then((value) {});
}

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
            style:
                Styles.textstyle14.copyWith(color: textColor ?? Colors.white),
          ),
        ),
      ),
    );
  }
}

Widget CustomTextFormFieldWithTitle({
  @required TextEditingController? controller,
  required TextInputType? type,
  String? hint,
  required String? title,
  Color? titleColor = Colors.black,
  required textDirection,
  Widget? prefixIcon,
  String? prefixText,
  Widget? suffixIcon,
  @required Function(String)? onChange,
  Color? errorColor,
  bool ispassword = false,
  bool isEnabled = true,
  required String? Function(String?)? validation,
}) {
  return Column(
    children: [
      Row(
        textDirection: TextDirection.rtl,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Text(title!,
                style: Styles.textstyle16
                    .copyWith(color: titleColor, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      TextFormField(
        enabled: isEnabled,
        style: TextStyle(
            fontWeight: FontWeight.w600, color: Colors.black, fontSize: 16.sp),
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
              color: const Color(0xffEFEFEF),
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
