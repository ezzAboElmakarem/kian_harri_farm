import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/Product_details/bloc/product_details_bloc.dart';
import 'package:kian_sheeps_projects/features/Product_details/views/product_details_views.dart';
import 'package:kian_sheeps_projects/features/cart/bloc/cart_bloc.dart';
import 'package:kian_sheeps_projects/features/cart/views/cart_view.dart';
import 'package:kian_sheeps_projects/features/favourities/bloc/favourite_bloc.dart';
import 'package:kian_sheeps_projects/features/offers/models/all_offer_model.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/navigation_methods.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class SimilarProductCard extends StatefulWidget {
  const SimilarProductCard({
    super.key,
    required this.isFavourite,
    this.similarProduct,
    // required this.categoryName,
    // required this.price,
    // required this.oldPrice,
    // required this.productName,
    // required this.imageUrl,
  });
  final bool isFavourite;
  final SimilarProduct? similarProduct;

  // final String categoryName;
  // final String price;
  // final String oldPrice;
  // final String productName;
  // final String imageUrl;

  @override
  State<SimilarProductCard> createState() => _SimilarProductCard();
}

class _SimilarProductCard extends State<SimilarProductCard> {
  bool _isFavourite = false;

  @override
  void initState() {
    super.initState();
    _isFavourite = widget.isFavourite;
  }

  String favouriteImage = AssetsData.fillHeartIcon;
  String notFavouriteImage = AssetsData.emptyHeartIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ProductDetailsBloc.of(context)
            .add(Get(arguments: widget.similarProduct?.id.toString()));
        RouteUtils.navigateTo(const ProductDetailsView());
      },
      child: Stack(
        children: [
          Container(
            width: 146.w,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12.r)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(height: 34.h),
                Container(
                  alignment: Alignment.center,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.network(
                    widget.similarProduct?.image ??
                        AssetsData.dummyProductImage,
                    width: double.infinity,
                    height: 120.h,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10.w, left: 8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.similarProduct?.category ?? "test",
                        style: TextStyles.textstyle14
                            .copyWith(color: ColorStyles.textGreyColor),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        widget.similarProduct?.name ?? "product",
                        style: TextStyles.textstyle14,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      widget.similarProduct?.price! ==
                              widget.similarProduct?.offerPrice
                          ? Row(
                              children: [
                                Text(
                                  widget.similarProduct?.price ?? " 200",
                                  style: TextStyles.textstyle14.copyWith(
                                    color: kPrimaryColor,
                                  ),
                                ),
                                const Spacer(),
                                // SizedBox(
                                //   width: 18.w,
                                // ),
                                GestureDetector(
                                    onTap: () {
                                      CartBloc.of(context).add(Get());

                                      navigateTo(
                                          context: context,
                                          widget: const CartView());
                                    },
                                    child: Image.asset(
                                      AssetsData.shoppingBasket,
                                      height: 24.h,
                                      width: 24.w,
                                    )),
                              ],
                            )
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.similarProduct?.price ?? '250',
                                  style: TextStyles.textstyle14.copyWith(
                                      color: ColorStyles.textGreyColor,
                                      decoration: TextDecoration.lineThrough,
                                      decorationThickness: 2.0),
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Text(
                                  widget.similarProduct?.offerPrice ?? " 200",
                                  style: TextStyles.textstyle14.copyWith(
                                    color: kPrimaryColor,
                                  ),
                                ),
                                const Spacer(),
                                // SizedBox(
                                //   width: 18.w,
                                // ),
                                GestureDetector(
                                    onTap: () {
                                      CartBloc.of(context).add(Get());

                                      navigateTo(
                                          context: context,
                                          widget: const CartView());
                                    },
                                    child: Image.asset(
                                      AssetsData.shoppingBasket,
                                      height: 24.h,
                                      width: 24.w,
                                    )),
                              ],
                            ),
                      SizedBox(
                        height: 8.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<FavouriteBloc, AppState>(builder: (context, state) {
            if (state is Error) {
              return Center(
                  child: Text(
                "error_getting_data".tr(),
                style: TextStyles.textstyle16,
              ));
            } else {
              return Positioned(
                // left: RouteUtils.isAR ? 0 : null,
                right: RouteUtils.isAR ? 4.w : 4.w,

                top: -30.h,
                child: SizedBox(
                  width: 140.w,
                  height: 100.h,
                  child: Row(
                    children: [
                      // const Spacer(
                      //   flex: 1,
                      // ),
                      GestureDetector(
                          // splashColor: Colors.transparent,
                          onTap: () {
                            _isFavourite = !_isFavourite;
                            log('state is : $_isFavourite');
                            setState(() {});
                            FavouriteBloc.get(context).add(Click(
                              arguments: {
                                "product_id": widget.similarProduct?.id,
                                "like": _isFavourite,
                              },
                            ));
                          },
                          child: Container(
                            // width: 70.w,
                            // height: 60.h,
                            color: Colors.transparent,
                            child: Image.asset(
                              _isFavourite ? favouriteImage : notFavouriteImage,
                            ),
                          )),
                      const Spacer(
                          // flex: 8,
                          ),

                      widget.similarProduct?.discount == '0' ||
                              widget.similarProduct?.discount == null
                          ? const SizedBox()
                          : CircleAvatar(
                              backgroundColor: ColorStyles.orangeColor,
                              radius: 20.r,
                              child: Column(
                                children: [
                                  Text("${widget.similarProduct?.discount}%",
                                      style: TextStyles.textstyle12.copyWith(
                                          color: Colors.white,
                                          fontSize: 9.sp,
                                          fontWeight: FontWeight.bold)),
                                  Text('discount'.tr(),
                                      style: TextStyles.textstyle12.copyWith(
                                          color: Colors.white, fontSize: 7.sp)),
                                ],
                              ),
                            ),
                      // const Spacer(
                      //   flex: 1,
                      // ),
                    ],
                  ),
                ),
              );

              //   return Positioned(
              //     left: RouteUtils.isAR ? 0 : null,
              //     right: RouteUtils.isAR ? null : 0,
              //     top: -12.h,
              //     child: Row(
              //       children: [
              //         SizedBox(
              //           width: 64.w,
              //         ),
              //         CircleAvatar(
              //           backgroundColor: ColorStyles.orangeColor,
              //           radius: 17.r,
              //           child: Column(
              //             children: [
              //               Text(widget.offer?.discount ?? '10',
              //                   style: TextStyles.textstyle12.copyWith(
              //                       color: Colors.white,
              //                       fontSize: 11.sp,
              //                       fontWeight: FontWeight.bold)),
              //               Text('خصم',
              //                   style: TextStyles.textstyle12.copyWith(
              //                       color: Colors.white, fontSize: 8.sp)),
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   );
              // } else {
              //   return const SizedBox();
              // }
            }
          }),
        ],
      ),
    );
  }
}