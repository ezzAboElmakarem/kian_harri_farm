import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/Product_details/bloc/product_details_bloc.dart';
import 'package:kian_sheeps_projects/features/Product_details/model/product_details_model.dart';
import 'select_order_num.dart';
import '../../../helper/assets.dart';
import '../../../helper/color_styles.dart';
import '../../../helper/text_styles.dart';

class ProductInfo extends StatelessWidget {
  final ProductDetailsModel? productDetailsModel;

  const ProductInfo({
    super.key,
    required this.productDetailsModel,
  });

  @override
  Widget build(BuildContext context) {
    var bloc = ProductDetailsBloc.of(context);
    bloc.sizeId = productDetailsModel?.data?.offer?.sizes?[0].id.toString();
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
                    productDetailsModel?.data?.offer?.image ??
                        AssetsData.dummyProductImage,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Text(
              // textAlign: TextAlign.right,
              productDetailsModel?.data?.offer?.category ?? 'اغنام',
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
              Text("${productDetailsModel?.data?.offer?.price ?? '555'} SR",
                  style: TextStyles.textstyle16.copyWith(color: kPrimaryColor)),
              SizedBox(width: 8.w),
              Text(
                  "${productDetailsModel?.data?.offer?.offerPrice ?? '444'} SR",
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'الوزن التقريبي',
                style: TextStyles.textstyle16
                    .copyWith(color: ColorStyles.hintColor),
              ),
              Text(
                ' : ',
                style: TextStyles.textstyle16
                    .copyWith(color: ColorStyles.hintColor),
              ),
              SizedBox(width: 4.w),
              Text(
                productDetailsModel?.data?.offer?.sizes?[0].name.toString() ??
                    'x',
                style: TextStyles.textstyle16,
                //textdirection: TextDirection.rtl,
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Text(
            'description'.tr(),
            style: TextStyles.textstyle16,
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: 260.w,
            child: Text(
              productDetailsModel?.data?.offer?.description ??
                  "dsfdsghfsdhgdfg",
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
