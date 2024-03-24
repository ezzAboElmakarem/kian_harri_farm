import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/widgets/custom_product_item.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class SimilarProductsSlider extends StatelessWidget {
  const SimilarProductsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 14.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              'منتجات مشابهة',
              textDirection: TextDirection.rtl,
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
                itemCount: 10,
                reverse: true,
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(width: 2.w),
                itemBuilder: (context, index) {
                  return const CustomProductCard(
                    categoryName: 'لحوم',
                    productName: 'قطعة استيك ',
                    price: "200",
                    oldPrice: "300",
                    imageUrl: AssetsData.meatOffers,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
