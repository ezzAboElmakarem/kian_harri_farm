import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/generated/l10n.dart';
import 'package:kian_sheeps_projects/widgets/custom_tex_form_field.dart';

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
          title: S.of(context).name,
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomTextFormField(
          ispassword: false,
          isEnabled: true,
          title: S.of(context).email,
        ),
        CustomTextFormField(
          ispassword: false,
          isEnabled: true,
          maxLines: 5,
          title: S.of(context).messeage_text,
          hint: S.of(context).messeage_hint_text,
        ),
        SizedBox(
          height: 24.h,
        ),
      ],
    );
  }
}
