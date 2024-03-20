import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/Product_details/views/product_details_views.dart';
import 'package:kian_sheeps_projects/features/cart/views/cart_view.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/navigation_methods.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.price,
    required this.oldPrice,
    required this.productName,
    required this.imageUrl,
    required this.categoryName,
    required this.cardWidth,
    required this.cardHeight,
  });
  final String categoryName;
  final String price;
  final String oldPrice;
  final String productName;
  final String imageUrl;
  final double cardWidth;
  final double cardHeight;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            navigateTo(context: context, widget: const ProductDetailsView());
          },
          child: SizedBox(
            height: 240.h,
            width: cardHeight,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 150.w,
                    height: 150.h,
                    child: Image.asset(imageUrl),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    categoryName,
                    style: TextStyles.textstyle14
                        .copyWith(color: ColorStyles.textGreyColor),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    price,
                    style: TextStyles.textstyle14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: () {
                            navigateTo(
                                context: context, widget: const CartView());
                          },
                          child: Image.asset(
                            AssetsData.shoppingBasket,
                            height: 24.h,
                            width: 24.w,
                          )),
                      SizedBox(
                        width: 18.w,
                      ),
                      Text(
                        '$price SR',
                        style: TextStyles.textstyle14.copyWith(
                          color: kPrimaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      Text(
                        '$oldPrice SR',
                        style: TextStyles.textstyle14.copyWith(
                            color: ColorStyles.textGreyColor,
                            decoration: TextDecoration.lineThrough,
                            decorationThickness: 2.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          //  top: 20.h,
          right: 120.w,
          child: CircleAvatar(
            backgroundColor: ColorStyles.orangeColor,
            radius: 17.r,
            child: Column(
              children: [
                Text('%10 ',
                    style: TextStyles.textstyle12.copyWith(
                        color: Colors.white,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.bold)),
                Text('خصم',
                    style: TextStyles.textstyle12
                        .copyWith(color: Colors.white, fontSize: 8.sp)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
