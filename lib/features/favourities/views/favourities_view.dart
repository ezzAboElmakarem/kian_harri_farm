import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/widgets/product_card.dart';
import 'package:kian_sheeps_projects/helper/app_bar_method.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: 'المفضلة'),
      body: SingleChildScrollView(
          child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 26.h),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2 / 3,
          crossAxisCount: 2,
          crossAxisSpacing: 2.w,
          mainAxisSpacing: 2.h,
        ),
        itemCount: 5,
        itemBuilder: (context, index) => ProductCard(
            cardHeight: 235.h,
            cardWidth: 100.w,
            price: '200',
            oldPrice: '230',
            productName: 'فريش بيف استربس',
            categoryName: 'لحوم',
            imageUrl: AssetsData.meatOffers),
      )),
    );
  }
}
