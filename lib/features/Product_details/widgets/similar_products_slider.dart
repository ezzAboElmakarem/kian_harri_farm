import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/Product_details/widgets/similar_products_card.dart';
import 'package:kian_sheeps_projects/main_models/product_model.dart';
import '../../../helper/text_styles.dart';

class SimilarProductsSlider extends StatelessWidget {
  const SimilarProductsSlider({super.key, required this.productDetailsModel});
  final ProductModel productDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 14.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              'منتجات مشابهة',
              //textdirection: TextDirection.rtl,
              style:
                  TextStyles.textstyle14.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 23.h,
          ),
          SizedBox(
            height: 260.h,
            child: ListView.separated(
                itemCount: productDetailsModel.similarProduct?.length ?? 0,
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(width: 2.w),
                itemBuilder: (context, index) {
                  return SimilarProductCard(
                    similarProduct: productDetailsModel.similarProduct?[index],
                    isFavourite: /*bloc.favouriteData.data?.product?[index].like??*/
                        false,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
