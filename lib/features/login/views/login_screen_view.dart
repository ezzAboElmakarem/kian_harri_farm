import 'package:flutter/material.dart';
import 'package:kian_sheeps_projects/features/login/widgets/login_screen_body.dart';
import 'package:kian_sheeps_projects/widgets/background_decoration.dart';

class LoginScreenView extends StatelessWidget {
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      body: DecoratedBackGround(
        child: LoginScreenBody(),
      ),
    );
  }
}
