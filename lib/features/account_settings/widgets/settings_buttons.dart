import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/generated/l10n.dart';
import 'package:kian_sheeps_projects/widgets/custom_button.dart';

class SettingsButtons extends StatelessWidget {
  const SettingsButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          buttonText: S.of(context).save_changes,
          onTap: () {},
        ),
        SizedBox(
          height: 14.h,
        ),
        CustomButton(
            buttonText: S.of(context).remove_account,
            onTap: () {},
            buttonColor: Colors.black.withOpacity(0.13),
            textColor: Colors.black),
      ],
    );
  }
}
