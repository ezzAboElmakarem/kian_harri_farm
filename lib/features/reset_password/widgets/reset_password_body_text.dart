import 'package:flutter/material.dart';
import '../../../helper/text_styles.dart';

class ResetPasswordBodyText extends StatelessWidget {
  const ResetPasswordBodyText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'كلمة المرور الجديدة يجب ان تكون مختلفة كليا عن كلمة المرو القديمة',
      textAlign: TextAlign.right,
      style:
          TextStyles.textstyle16.copyWith(color: Colors.black.withOpacity(0.5)),
    );
  }
}
