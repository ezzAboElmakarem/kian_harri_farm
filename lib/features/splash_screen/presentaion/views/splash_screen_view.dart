import 'package:flutter/material.dart';
import 'package:kian_sheeps_projects/core/utlis/component.dart';
import 'package:kian_sheeps_projects/features/onbording_screen/presentaion/views/onbording_screen_view.dart';
import 'package:kian_sheeps_projects/features/splash_screen/presentaion/views/widgets/splash_screen_body.dart';

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
      body: SplashScreenBody(),
    );
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        // Get.to(() => const HomeView(),
        //     // calculations
        //     transition: Transition.fade,
        //     duration: kTranstionDuration);

        navigateandfinish(
            context: context, widget: const OnBordingScreenView());
      },
    );
  }
}
