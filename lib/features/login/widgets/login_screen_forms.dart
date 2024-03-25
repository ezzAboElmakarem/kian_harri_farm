import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/generated/l10n.dart';
import 'package:kian_sheeps_projects/helper/is_arabic_method.dart';
import 'package:kian_sheeps_projects/widgets/custom_tex_form_field.dart';

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
          title: S.of(context).email_or_phone,
          type: TextInputType.emailAddress,
          ispassword: false,
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomTextFormField(
          isEnabled: true,
          type: TextInputType.visiblePassword,
          title: S.of(context).password,
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
              : Text(''),
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
              : Text(''),
        ),
      ],
    );
  }
}
