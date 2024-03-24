import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/widgets/product_card.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 8.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2.5 / 3,
          crossAxisCount: 2,
          crossAxisSpacing: 0.w,
          mainAxisSpacing: 2.h,
        ),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return const ProductCard(
              price: '200',
              oldPrice: '230',
              productName: 'فريش بيف استربس',
              categoryName: 'لحوم',
              imageUrl: AssetsData.meatOffers);
          // SizedBox(
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
          //     child: ProductCard(
          //         cardHeight: 235.h,
          //         cardWidth: 100.w,
          //         price: '200',
          //         oldPrice: '230',
          //         productName: 'فريش بيف استربس',
          //         categoryName: 'لحوم',
          //         imageUrl: AssetsData.meatOffers),
          //   ),
          // );
        },
      ),
    );
  }
}
