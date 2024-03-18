import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/home/widgets/product_card.dart';
import 'package:kian_sheeps_projects/features/offers/views/offers_view.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/navigation_methods.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class SimilarProductsSlider extends StatelessWidget {
  const SimilarProductsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  navigateTo(context: context, widget: OffersView());
                },
                child: Text(
                  'عرض المزيد',
                  style: TextStyles.textstyle14.copyWith(color: kPrimaryColor),
                ),
              ),
              const Spacer(),
              Text(
                'منتجات مشابهة',
                style: TextStyles.textstyle14
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 23.h,
          ),
          SizedBox(
            height: 240.h,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(
                width: 1.h,
              ),
              itemCount: 8,
              reverse: true,
              itemBuilder: (context, index) => ProductCard(
                  cardHeight: 235.h,
                  cardWidth: 100.w,
                  price: '200',
                  oldPrice: '230',
                  productName: 'فريش بيف استربس',
                  categoryName: 'لحوم',
                  imageUrl: AssetsData.meatOffers),
            ),
          ),
        ],
      ),
    );
  }
}
