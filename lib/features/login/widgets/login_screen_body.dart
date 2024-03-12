import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/widgets/visitor_button.dart';
import 'package:kian_sheeps_projects/features/register/views/register_view.dart';
import 'package:kian_sheeps_projects/widgets/question_and_button.dart';
import 'package:kian_sheeps_projects/features/login/widgets/forget_password_button.dart';
import 'package:kian_sheeps_projects/features/login/widgets/login_button.dart';
import 'package:kian_sheeps_projects/widgets/custom_tex_form_field.dart';
import 'package:kian_sheeps_projects/widgets/logo_and_screen_title.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  TextEditingController? phoneNumberOrEmailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  String? email, password;

  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LogoAndScreenTitle(screenTitle: "تسجيل الدخول"),
                SizedBox(
                  height: 30.h,
                ),
                CustomTextFormField(
                  isEnabled: true,
                  controller: phoneNumberOrEmailController,
                  type: TextInputType.emailAddress,
                  title: 'رقم الجوال / البريد الالكتروني',
                  textDirection: TextDirection.rtl,
                  onChange: (String val) {},
                  validation: (value) {
                    if (value!.isEmpty) {
                      return 'يجب ادخال البريد الالكتروني';
                    }
                    return null;
                  },
                  ispassword: false,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFormField(
                  isEnabled: true,
                  ispassword: isPassword,
                  controller: passwordController,
                  type: TextInputType.visiblePassword,
                  title: 'كلمة المرور',
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
                const ForgetPasswordTextButton(),
                SizedBox(
                  height: 15.h,
                ),
                LoginButton(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                      return;
                    }
                  },
                ),
                SizedBox(
                  height: 56.h,
                ),
                QuestionAndButton(
                  text: 'إنشاء حساب جديد',
                  questionText: 'ليس لديك حساب ؟',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreenView(),
                      ),
                    );
                    // RouteUtils.navigateTo(const NewLoginScreenView());
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                VisitorButton(onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
