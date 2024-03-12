import 'package:flutter/material.dart';
import 'package:kian_sheeps_projects/core/utlis/component.dart';
import 'package:kian_sheeps_projects/core/utlis/styles.dart';
import 'package:kian_sheeps_projects/features/login/presentation/views/login_screen_view.dart';

class skipButtonWidget extends StatelessWidget {
  const skipButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        navigateTo(context: context, widget: const LoginScreenView());
      },
      child: Align(
        alignment: Alignment.topRight,
        child: Text(
          'تخطى',
          style: Styles.textstyle16.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
