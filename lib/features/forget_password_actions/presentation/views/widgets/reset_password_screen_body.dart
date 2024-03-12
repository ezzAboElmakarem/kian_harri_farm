import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/utlis/component.dart';
import 'package:kian_sheeps_projects/core/widgets/logo_image_&_screen__title.dart';
import 'package:kian_sheeps_projects/features/forget_password_actions/presentation/views/widgets/reset_password_body_text.dart';

class ResetPasswordScreenBody extends StatefulWidget {
  const ResetPasswordScreenBody({super.key});

  @override
  State<ResetPasswordScreenBody> createState() =>
      _ResetPasswordScreenBodyState();
}

class _ResetPasswordScreenBodyState extends State<ResetPasswordScreenBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  var passwordConfirmController = TextEditingController();

  TextEditingController? passwordController = TextEditingController();
  String? email, password;

  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
            ),
            child: Column(
              children: [
                const LogoAndScreenTitle(screenTitle: 'اعادة ضبط كلمة المرور'),
                SizedBox(
                  height: 22.h,
                ),
                const ResetPasswordBodyText(),
                SizedBox(
                  height: 40.h,
                ),
                CustomTextFormFieldWithTitle(
                  ispassword: isPassword,
                  controller: passwordController,
                  type: TextInputType.visiblePassword,
                  title: 'كلمة المرور الجديدة',
                  textDirection: TextDirection.rtl,
                  errorColor: Colors.red,
                  validation: (value) {
                    if (value!.isEmpty) {
                      return 'يجب ادخال كلمة المرور';
                    }
                    return null;
                  },
                  onChange: (data) {
                    password = data;
                  },
                  prefixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    icon: Icon(
                        isPassword ? Icons.visibility_off : Icons.visibility),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFormFieldWithTitle(
                  title: 'تأكيد كلمة المرور الجديدة',
                  controller: passwordConfirmController,
                  validation: (value) {
                    if (value != passwordController?.value.text) {
                      return "كلمة مرور غير مطابقة ";
                    }
                    return null;
                  },
                  type: TextInputType.visiblePassword,
                  ispassword: isPassword,
                  prefixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    icon: Icon(
                        isPassword ? Icons.visibility_off : Icons.visibility),
                  ),
                  onChange: null,
                  textDirection: TextDirection.ltr,
                ),
                SizedBox(
                  height: 40.h,
                ),
                CustomButton(
                  buttonText: 'تاكيد',
                  textColor: null,
                  onTap: () {},
                ),
                SizedBox(
                  height: 40.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
