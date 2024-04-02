import 'package:flutter/material.dart';
import 'package:kian_sheeps_projects/core/AppStorage.dart';
import 'package:kian_sheeps_projects/features/home/views/home_view.dart';
import 'package:kian_sheeps_projects/features/login/views/login_screen_view.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
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
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (AppStorage.isLogged) {
          RouteUtils.navigateAndPopAll(HomeView());
        } else if (AppStorage.isOnBoardingComplete) {
          RouteUtils.navigateAndPopAll(const LoginScreenView());
        } else {
          RouteUtils.navigateAndPopAll(const OnBordingScreenView());
        }
      },
    );
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
