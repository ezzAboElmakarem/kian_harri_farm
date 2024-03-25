import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/generated/l10n.dart';
import 'package:kian_sheeps_projects/widgets/custom_tex_form_field.dart';

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
          title: S.of(context).name,
          hint: 'محمد الحديدي',
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomTextFormField(
          ispassword: false,
          isEnabled: false,
          title: S.of(context).phone,
          hint: '012345689',
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomTextFormField(
          ispassword: false,
          isEnabled: false,
          title: S.of(context).email,
          hint: 'mohamedabbas@gmail.com',
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomTextFormField(
          ispassword: true,
          isEnabled: false,
          title: S.of(context).password,
          hint: '***********',
        ),
      ],
    );
  }
}
