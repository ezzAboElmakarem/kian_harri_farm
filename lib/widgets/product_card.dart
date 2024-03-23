import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/Product_details/views/product_details_views.dart';
import 'package:kian_sheeps_projects/features/cart/views/cart_view.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/navigation_methods.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class ProductCard extends StatefulWidget {
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
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavouite = false;
  String favouriteImage = AssetsData.fillHeartIcon;
  String notFavouriteImage = AssetsData.emptyHeartIcon;
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
            width: widget.cardHeight,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 150.w,
                    height: 150.h,
                    child: Image.asset(widget.imageUrl),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    widget.categoryName,
                    style: TextStyles.textstyle14
                        .copyWith(color: ColorStyles.textGreyColor),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    widget.price,
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
                        '${widget.price} SR',
                        style: TextStyles.textstyle14.copyWith(
                          color: kPrimaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      Text(
                        '${widget.oldPrice} SR',
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
        Positioned(
            top: -8.h,
            right: 6.w,
            left: 140.w,
            child: InkWell(
                onTap: () {
                  isFavouite = !isFavouite;
                  log('state is : $isFavouite');
                  setState(() {});
                },
                child: Container(
                  width: 60.w,
                  height: 60.h,
                  color: Colors.transparent,
                  child: Image.asset(
                      isFavouite ? favouriteImage : notFavouriteImage),
                ))),
      ],
    );
  }
}
