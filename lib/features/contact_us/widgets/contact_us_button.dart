import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../widgets/custom_button.dart';

class ContuctUsButton extends StatelessWidget {
  const ContuctUsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(buttonText: "send".tr(), onTap: () {});
  }
}
