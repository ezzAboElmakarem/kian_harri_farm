import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/custom_tex_form_field.dart';

class VisaForm extends StatelessWidget {
  const VisaForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          ispassword: false,
          isEnabled: true,
          title: 'رقم البطاقة',
          fillColor: Colors.white,
        ),
        SizedBox(
          height: 12.h,
        ),
        CustomTextFormField(
          ispassword: false,
          isEnabled: true,
          title: 'اسم حامل البطاقة',
          fillColor: Colors.white,
        ),
        SizedBox(
          height: 12.h,
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                ispassword: false,
                isEnabled: true,
                title: 'رمز الامان',
                fillColor: Colors.white,
                type: TextInputType.number,
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Expanded(
              child: CustomTextFormField(
                ispassword: false,
                type: TextInputType.datetime,
                isEnabled: true,
                title: 'تاريخ الانتهاء',
                fillColor: Colors.white,
                hint: 'شهر/ سنة',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
