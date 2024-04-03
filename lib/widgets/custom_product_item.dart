import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/home/models/home_model.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import '../features/Product_details/views/product_details_views.dart';
import '../features/cart/views/cart_view.dart';
import '../helper/assets.dart';
import '../helper/color_styles.dart';
import '../helper/navigation_methods.dart';
import '../helper/text_styles.dart';

class CustomProductCard extends StatefulWidget {
  const CustomProductCard({
    super.key,
    this.offer,
    // required this.categoryName,
    // required this.price,
    // required this.oldPrice,
    // required this.productName,
    // required this.imageUrl,
  });
  final Offer? offer;
  // final String categoryName;
  // final String price;
  // final String oldPrice;
  // final String productName;
  // final String imageUrl;

  @override
  State<CustomProductCard> createState() => _CustomProductCardState();
}

class _CustomProductCardState extends State<CustomProductCard> {
  bool isFavouite = false;
  String favouriteImage = AssetsData.fillHeartIcon;
  String notFavouriteImage = AssetsData.emptyHeartIcon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(context: context, widget: const ProductDetailsView());
      },
      child: Container(
        width: 146.w,
        color: Colors.white,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 34.h),
                Expanded(
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        widget.offer?.image ?? AssetsData.dummyProductImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          widget.offer?.category ?? "category",
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
                          widget.offer?.name ?? "product",
                          style: TextStyles.textstyle14,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Text(
                            widget.offer?.offerPrice ?? '250',
                            style: TextStyles.textstyle14.copyWith(
                                color: ColorStyles.textGreyColor,
                                decoration: TextDecoration.lineThrough,
                                decorationThickness: 2.0),
                          ),
                          SizedBox(
                            width: 6.w,
                          ),
                          Text(
                            widget.offer?.price ?? " 200",
                            style: TextStyles.textstyle14.copyWith(
                              color: kPrimaryColor,
                            ),
                          ),
                          SizedBox(
                            width: 18.w,
                          ),
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
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              left: RouteUtils.isAR ? 0 : null,
              right: RouteUtils.isAR ? null : 0,
              top: -12.h,
              child: Row(
                children: [
                  InkWell(
                      splashColor: Colors.transparent,
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
                  SizedBox(
                    width: 64.w,
                  ),
                  CircleAvatar(
                    backgroundColor: ColorStyles.orangeColor,
                    radius: 17.r,
                    child: Column(
                      children: [
                        Text(widget.offer?.discount ?? '10',
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
