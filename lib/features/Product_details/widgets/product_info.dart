import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/Product_details/widgets/select_order_num.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key,
    required this.productPrice,
    required this.oldProductPrice,
    required this.productType,
    required this.productWeight,
    required this.productDescription,
  });
  final int productPrice;
  final int oldProductPrice;
  final String productType;
  final int productWeight;
  final String productDescription;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 22.h,
            ),
            child: Center(
              child: Container(
                height: 160.h,
                width: 342.w,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
                child: Image.asset(AssetsData.productDetails),
              ),
            ),
          ),
          Text(
              textAlign: TextAlign.right,
              'لحوم',
              style: TextStyles.textstyle12.copyWith(color: kPrimaryColor)),
          SizedBox(height: 7.h),
          /****** */
          const SelectOrderNum(),
          /**** */
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('$productPrice SR',
                  style: TextStyles.textstyle16.copyWith(color: kPrimaryColor)),
              SizedBox(width: 8.w),
              Text('$oldProductPrice SR',
                  style: TextStyles.textstyle14.copyWith(
                      color: ColorStyles.textGreyColor.withOpacity(0.5),
                      decoration: TextDecoration.lineThrough,
                      decorationThickness: 2.0)),
            ],
          ),
          SizedBox(height: 14.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(productType, style: TextStyles.textstyle16),
              SizedBox(width: 4.w),
              Text(': النوع',
                  style: TextStyles.textstyle16
                      .copyWith(color: ColorStyles.hintColor)),
            ],
          ),
          SizedBox(height: 14.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '$productWeight كيلو ',
                style: TextStyles.textstyle16,
                //textdirection: TextDirection.rtl,
              ),
              SizedBox(width: 4.w),
              Text(
                ': الوزن التقريبي',
                style: TextStyles.textstyle16
                    .copyWith(color: ColorStyles.hintColor),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Text(
            'الوصف',
            style: TextStyles.textstyle16,
          ),
          SizedBox(height: 16.h),
          Text(
            productDescription,
            //textdirection: TextDirection.rtl,
            style: TextStyles.textstyle16.copyWith(
              color: ColorStyles.hintColor.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}
