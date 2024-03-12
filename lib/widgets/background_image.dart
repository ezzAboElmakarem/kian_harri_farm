import 'package:flutter/material.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetsData.backgroundImage,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
