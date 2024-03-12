import 'package:flutter/material.dart';
import 'package:kian_sheeps_projects/features/onbording/widgets/onbording_screen_body.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/widgets/background_decoration.dart';

class OnBordingScreenView extends StatelessWidget {
  const OnBordingScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DecoratedBackGround(child: OnBordingScreenBody()),
    );
  }
}
