import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/main_models/product_model.dart';
import 'select_order_num.dart';
import '../../../helper/assets.dart';
import '../../../helper/color_styles.dart';
import '../../../helper/text_styles.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key,
    required this.productDetailsModel,
  });

  final ProductModel? productDetailsModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 22.h,
            ),
            child: Center(
              child: Container(
                height: 260.h,
                width: 300.w,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network(
                    productDetailsModel?.image ?? AssetsData.dummyProductImage,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Text(
              // textAlign: TextAlign.right,
              productDetailsModel?.category ?? 'اغنام',
              style: TextStyles.textstyle12.copyWith(color: kPrimaryColor)),
          SizedBox(height: 7.h),
          /****** */
          SelectOrderNum(
            productDetailsModel: productDetailsModel,
          ),

          /**** */
          SizedBox(height: 7.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("${productDetailsModel?.price ?? '555'} SR",
                  style: TextStyles.textstyle16.copyWith(color: kPrimaryColor)),
              SizedBox(width: 8.w),
              Text("${productDetailsModel?.offerPrice ?? '444'} SR",
                  style: TextStyles.textstyle14.copyWith(
                      color: ColorStyles.textGreyColor.withOpacity(0.5),
                      decoration: TextDecoration.lineThrough,
                      decorationThickness: 2.0)),
            ],
          ),
          SizedBox(height: 14.h),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     Text('النوع',
          //         style: TextStyles.textstyle16
          //             .copyWith(color: ColorStyles.hintColor)),
          //     Text(
          //       ' : ',
          //       style: TextStyles.textstyle16
          //           .copyWith(color: ColorStyles.hintColor),
          //     ),
          //     SizedBox(width: 4.w),
          //     Text(productDetailsModel?.category ?? 'some type'  , style: TextStyles.textstyle16),
          //   ],
          // ),
          // SizedBox(height: 14.h),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     Text(
          //       'الوزن التقريبي',
          //       style: TextStyles.textstyle16
          //           .copyWith(color: ColorStyles.hintColor),
          //     ),
          //     Text(
          //       ' : ',
          //       style: TextStyles.textstyle16
          //           .copyWith(color: ColorStyles.hintColor),
          //     ),
          //     SizedBox(width: 4.w),
          //     Text(
          //       '$productWeight كيلو ',
          //       style: TextStyles.textstyle16,
          //       //textdirection: TextDirection.rtl,
          //     ),
          //   ],
          // ),
          // SizedBox(height: 20.h),
          Text(
            'description'.tr(),
            style: TextStyles.textstyle16,
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: 260.w,
            child: Text(
              productDetailsModel?.description ?? "dsfdsghfsdhgdfg",
              // overflow: TextOverflow.ellipsis,
              // maxLines: 1,
              //textdirection: TextDirection.rtl,
              style: TextStyles.textstyle16.copyWith(
                color: ColorStyles.hintColor.withOpacity(0.6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
