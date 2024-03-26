import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/custom_button.dart';

class UpdateProfileButtons extends StatelessWidget {
  const UpdateProfileButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          buttonText: "save_changes".tr(),
          onTap: () {},
        ),
        SizedBox(
          height: 18.h,
        ),
        CustomButton(
            buttonText: "remove_account".tr(),
            onTap: () {},
            buttonColor: Colors.black.withOpacity(0.13),
            textColor: Colors.black),
      ],
    );
  }
}
