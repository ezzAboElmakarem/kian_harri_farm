import 'package:flutter/material.dart';
import 'package:kian_sheeps_projects/generated/l10n.dart';
import 'package:kian_sheeps_projects/widgets/custom_button.dart';

class ContuctUsButton extends StatelessWidget {
  const ContuctUsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(buttonText: S.of(context).send, onTap: () {});
  }
}
