import 'package:flutter/material.dart';
import '../../onbording/views/onbording_screen_view.dart';
import '../widgets/splash_logo.dart';
import '../../../widgets/background_decoration.dart';

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
