import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/custom_tex_form_field.dart';

class ContactUsForms extends StatelessWidget {
  const ContactUsForms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          ispassword: false,
          isEnabled: true,
          title: "name".tr(),
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomTextFormField(
          ispassword: false,
          isEnabled: true,
          title: "email".tr(),
        ),
        CustomTextFormField(
          ispassword: false,
          isEnabled: true,
          maxLines: 5,
          title: "messeage_text".tr(),
          hint: "messeage_hint_text".tr(),
        ),
        SizedBox(
          height: 24.h,
        ),
      ],
    );
  }
}
