import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../helper/color_styles.dart';
import '../helper/text_styles.dart';

class VisitorButton extends StatelessWidget {
  const VisitorButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text("vistor_button".tr(),
          style: TextStyles.textstyle16.copyWith(color: kPrimaryColor)),
    );
  }
}
