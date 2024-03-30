import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../helper/text_styles.dart';

class ResetPasswordBodyText extends StatelessWidget {
  const ResetPasswordBodyText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "reset_pass_body_text".tr(),
          style: TextStyles.textstyle16
              .copyWith(color: Colors.black.withOpacity(0.5)),
        ),
      ],
    );
  }
}
