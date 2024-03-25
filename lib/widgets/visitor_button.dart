import 'package:flutter/material.dart';
import 'package:kian_sheeps_projects/generated/l10n.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

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
      child: Text(S.of(context).vistor_button,
          style: TextStyles.textstyle16.copyWith(color: kPrimaryColor)),
    );
  }
}
