import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/widgets/question_and_button.dart';
import 'package:kian_sheeps_projects/features/register/widgets/accept_terms_widgets.dart';
import 'package:kian_sheeps_projects/widgets/custom_button.dart';
import 'package:kian_sheeps_projects/widgets/custom_tex_form_field.dart';
import 'package:kian_sheeps_projects/widgets/custom_text_button.dart';
import 'package:kian_sheeps_projects/widgets/logo_and_screen_title.dart';

class RegisterScreenView extends StatefulWidget {
  const RegisterScreenView({super.key});

  @override
  State<RegisterScreenView> createState() => _RegisterScreenViewState();
}

class _RegisterScreenViewState extends State<RegisterScreenView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  var passwordConfirmController = TextEditingController();

  TextEditingController? userNameController = TextEditingController();
  TextEditingController? phoneNumberController = TextEditingController();

  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  String? email, password;

  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: Column(
                children: [
                  const LogoAndScreenTitle(
                    screenTitle: 'تسجيل الدخول',
                  ),
                  CustomTextFormField(
                    controller: userNameController,
                    type: TextInputType.name,
                    title: "الاسم",
                    textDirection: TextDirection.rtl,
                    onChange: (String value) {},
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'يجب ادخال البريد الالكتروني';
                      }
                      return null;
                    },
                    ispassword: false,
                    isEnabled: true,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextFormField(
                    isEnabled: true,
                    controller: phoneNumberController,
                    type: TextInputType.phone,
                    title: 'رقم الجوال',
                    textDirection: TextDirection.rtl,
                    onChange: (String value) {},
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
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    title: "البريد الالكترونى",
                    textDirection: TextDirection.rtl,
                    onChange: (String value) {},
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
                  CustomTextFormField(
                    isEnabled: true,
                    title: 'تأكيد كلمة المرور',
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
                    height: 24.h,
                  ),
                  const AcceptTermsWidget(),
                  SizedBox(
                    height: 45.h,
                  ),
                  CustomButton(
                    buttonText: 'تسجيل الدخول',
                    textColor: Colors.white,
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
                    height: 15.h,
                  ),
                  QuestionAndButton(
                      text: 'تسجيل الدخول',
                      questionText: 'لديك حساب ؟',
                      onTap: () {}),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomTextButton(
                    text: 'التصفح بدون تسجيل دخول',
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
