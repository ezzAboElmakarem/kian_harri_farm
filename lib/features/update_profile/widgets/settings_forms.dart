import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/custom_tex_form_field.dart';

class SettingsForms extends StatelessWidget {
  const SettingsForms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          ispassword: false,
          isEnabled: false,
          title: "name".tr(),
          hint: 'محمد الحديدي',
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomTextFormField(
          ispassword: false,
          isEnabled: false,
          title: "phone".tr(),
          hint: '012345689',
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomTextFormField(
          ispassword: false,
          isEnabled: false,
          title: "email".tr(),
          hint: 'mohamedabbas@gmail.com',
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomTextFormField(
          ispassword: true,
          isEnabled: false,
          title: "password".tr(),
          hint: '***********',
        ),
      ],
    );
  }
}
