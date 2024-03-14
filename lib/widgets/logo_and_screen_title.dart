import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';
import 'package:kian_sheeps_projects/widgets/logo_image_widget.dart';

class LogoAndScreenTitle extends StatelessWidget {
  const LogoAndScreenTitle({
    super.key,
    required this.screenTitle,
  });
  final String screenTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 103.h,
        ),
        const LogoImageWidget(height: 132, width: 132),
        SizedBox(
          height: 19.h,
        ),
        Text(
          screenTitle,
          style: TextStyles.textstyle20.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
