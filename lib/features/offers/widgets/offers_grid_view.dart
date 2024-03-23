import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/widgets/product_card.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';

class OffersGridView extends StatelessWidget {
  const OffersGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: GridView.builder(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 6.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2 / 3,
          crossAxisCount: 2,
          crossAxisSpacing: 2.w,
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
        },
      ),
    );
  }
}
