import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helper/assets.dart';

class LogoImageWidget extends StatelessWidget {
  const LogoImageWidget({
    super.key,
    required this.height,
    required this.width,
  });
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Image.asset(AssetsData.logo1, height: height.h, width: width.w);
  }
}
