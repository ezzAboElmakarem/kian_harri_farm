import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/cart/views/cart_view.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/navigation_methods.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class CustomProductCard extends StatefulWidget {
  const CustomProductCard({
    super.key,
    required this.categoryName,
    required this.price,
    required this.oldPrice,
    required this.productName,
    required this.imageUrl,
  });
  final String categoryName;
  final String price;
  final String oldPrice;
  final String productName;
  final String imageUrl;

  @override
  State<CustomProductCard> createState() => _CustomProductCardState();
}

class _CustomProductCardState extends State<CustomProductCard> {
  bool isFavouite = false;
  String favouriteImage = AssetsData.fillHeartIcon;
  String notFavouriteImage = AssetsData.emptyHeartIcon;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(AssetsData.meatOffers, fit: BoxFit.cover),
            SizedBox(
              height: 6.h,
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'لحوم',
                      style: TextStyles.textstyle14
                          .copyWith(color: ColorStyles.textGreyColor),
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'لحمه استربس',
                      style: TextStyles.textstyle14,
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
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
                        '200 SR',
                        style: TextStyles.textstyle14.copyWith(
                          color: kPrimaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      Text(
                        '300 SR',
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
          ],
        ),
        Row(
          children: [
            CircleAvatar(
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
            SizedBox(
              width: 64.w,
            ),
            InkWell(
                onTap: () {
                  isFavouite = !isFavouite;
                  log('state is : $isFavouite');
                  setState(() {});
                },
                child: Container(
                  width: 70.w,
                  height: 60.h,
                  color: Colors.transparent,
                  child: Image.asset(
                    isFavouite ? favouriteImage : notFavouriteImage,
                  ),
                )),
          ],
        ),
      ],
    );
  }
}
