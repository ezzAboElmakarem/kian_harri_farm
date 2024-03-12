import 'package:flutter/material.dart';
import 'package:kian_sheeps_projects/features/onbording/views/onbording_screen_view.dart';
import 'package:kian_sheeps_projects/features/splash_screen/widgets/splash_logo.dart';
import 'package:kian_sheeps_projects/widgets/background_decoration.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    navigateToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DecoratedBackGround(
        child: SplashLogo(),
      ),
    );
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const OnBordingScreenView(),
            ),
            (route) => false);
        // RouteUtils.navigateAndPopAll(const OnBordingScreenView());
      },
    );
  }
}
