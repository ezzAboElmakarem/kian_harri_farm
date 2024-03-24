import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/widgets/custom_product_item.dart';
import 'package:kian_sheeps_projects/widgets/product_card.dart';
import 'package:kian_sheeps_projects/features/offers/views/offers_view.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/navigation_methods.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class OffersListView extends StatelessWidget {
  const OffersListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    navigateTo(context: context, widget: OffersView());
                  },
                  child: Text(
                    'عرض المزيد',
                    style:
                        TextStyles.textstyle14.copyWith(color: kPrimaryColor),
                  ),
                ),
                const Spacer(),
                Text(
                  'العروض',
                  style: TextStyles.textstyle14
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
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
                    imageUrl: AssetsData.fishOffer,
                  );
                }),
          ),
          /*
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProductCard(
                  price: '160',
                  oldPrice: '200',
                  productName: 'سمك فريش',
                  imageUrl: AssetsData.fishOffer),
              ProductCard(
                  price: '200',
                  oldPrice: '230',
                  productName: 'فريش بيف استربس',
                  imageUrl: AssetsData.meatOffers),
            ],
          ),
          */
        ],
      ),
    );
  }
}
