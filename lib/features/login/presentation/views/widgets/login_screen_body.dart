import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/utlis/component.dart';
import 'package:kian_sheeps_projects/core/widgets/check_app_without_login_button.dart';
import 'package:kian_sheeps_projects/features/login/presentation/views/new_login_screen_view.dart';
import 'package:kian_sheeps_projects/core/widgets/asking_for_login_or_sgin_up_.dart';
import 'package:kian_sheeps_projects/features/login/presentation/views/widgets/forget_password_text_button.dart';
import 'package:kian_sheeps_projects/features/login/presentation/views/widgets/login_button.dart';
import 'package:kian_sheeps_projects/core/widgets/logo_image_&_screen__title.dart';

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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Form(
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
                  CustomTextFormFieldWithTitle(
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
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextFormFieldWithTitle(
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
                  AskingForLoginOrSignUp(
                    text: 'إنشاء حساب جديد',
                    questionText: 'ليس لديك حساب ؟',
                    onTap: () {
                      navigateTo(
                          context: context, widget: const NewLoginScreenView());
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CheckAppWithoutLoginButton(onTap: () {}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
