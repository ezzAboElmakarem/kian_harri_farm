import 'package:flutter/material.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/widgets/custom_tex_form_field.dart';

class ReceivingLocation extends StatelessWidget {
  const ReceivingLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      ispassword: false,
      isEnabled: false,
      title: 'تحديد موقع الاستلام على الخريطة',
      prefixIcon: Image.asset(AssetsData.arrowPointer),
    );
  }
}
