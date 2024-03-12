import 'package:flutter/material.dart';
import 'package:kian_sheeps_projects/features/onbording_screen/presentaion/views/widgets/onbording_screen_body.dart';

class OnBordingScreenView extends StatefulWidget {
  const OnBordingScreenView({super.key});

  @override
  State<OnBordingScreenView> createState() => _OnBordingScreenViewState();
}

class _OnBordingScreenViewState extends State<OnBordingScreenView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnBordingScreenBody(),
    );
  }
}
