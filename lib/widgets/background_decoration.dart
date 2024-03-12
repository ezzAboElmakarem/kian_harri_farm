import 'package:flutter/material.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';

class DecoratedBackGround extends StatelessWidget {
  final Widget child;
  const DecoratedBackGround({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AssetsData.backgroundImage,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
