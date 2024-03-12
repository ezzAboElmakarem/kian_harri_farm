import 'package:flutter/material.dart';
import 'package:kian_sheeps_projects/features/login/presentation/views/widgets/login_screen_body.dart';

class LoginScreenView extends StatelessWidget {
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginScreenBody(),
    );
  }
}
