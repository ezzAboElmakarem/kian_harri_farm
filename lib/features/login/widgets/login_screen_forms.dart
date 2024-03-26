import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../helper/is_arabic_method.dart';
import '../../../widgets/custom_tex_form_field.dart';

class LoginScreenForms extends StatefulWidget {
  const LoginScreenForms({super.key});

  @override
  State<LoginScreenForms> createState() => _LoginScreenFormsState();
}

class _LoginScreenFormsState extends State<LoginScreenForms> {
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextFormField(
          isEnabled: true,
          title: "email_or_phone".tr(),
          type: TextInputType.emailAddress,
          ispassword: false,
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomTextFormField(
          isEnabled: true,
          type: TextInputType.visiblePassword,
          title: "password".tr(),
          ispassword: isPassword,
          prefixIcon: isArabic()
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isPassword = !isPassword;
                    });
                  },
                  icon: Icon(
                      isPassword ? Icons.visibility_off : Icons.visibility),
                )
              : const Text(''),
          suffixIcon: isArabic() == false
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isPassword = !isPassword;
                    });
                  },
                  icon: Icon(
                      isPassword ? Icons.visibility_off : Icons.visibility),
                )
              : const Text(''),
        ),
      ],
    );
  }
}
