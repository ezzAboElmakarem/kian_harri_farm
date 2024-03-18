import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 22.h),
      child: Center(
        child: Container(
          height: 160.h,
          width: 342.w,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
          child: Image.asset(AssetsData.productDetails),
        ),
      ),
    );
  }
}
