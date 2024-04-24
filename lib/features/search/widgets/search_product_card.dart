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
import 'package:kian_sheeps_projects/features/search/models/search_model.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/navigation_methods.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class SearchProductCard extends StatefulWidget {
  const SearchProductCard({
    super.key,
    this.searchItem,
    required this.isFavourite,
    // required this.categoryName,
    // required this.price,
    // required this.oldPrice,
    // required this.productName,
    // required this.imageUrl,
  });

  final SearchItem? searchItem;
  final bool isFavourite;

  // final String categoryName;
  // final String price;
  // final String oldPrice;
  // final String productName;
  // final String imageUrl;

  @override
  State<SearchProductCard> createState() => _CustomProductCardState();
}

class _CustomProductCardState extends State<SearchProductCard> {
  bool _isFavourite = false;
  String favouriteImage = AssetsData.fillHeartIcon;
  String notFavouriteImage = AssetsData.emptyHeartIcon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ProductDetailsBloc.of(context)
            .add(Get(arguments: widget.searchItem?.id ?? ''));
        navigateTo(context: context, widget: const ProductDetailsView());
      },
      child: Container(
        width: 146.w,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12.r)),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 34.h),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.w,
                    ),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          widget.searchItem?.image ??
                              AssetsData.dummyProductImage,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
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
                        widget.searchItem?.category ?? "category",
                        style: TextStyles.textstyle14
                            .copyWith(color: ColorStyles.textGreyColor),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        widget.searchItem?.name ?? "product",
                        style: TextStyles.textstyle14,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      widget.searchItem?.price == widget.searchItem?.offerPrice
                          ? Row(
                              children: [
                                Text(
                                  widget.searchItem?.offerPrice ?? " 200",
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
                                  widget.searchItem?.price ?? '250',
                                  style: TextStyles.textstyle14.copyWith(
                                      color: ColorStyles.textGreyColor,
                                      decoration: TextDecoration.lineThrough,
                                      decorationThickness: 2.0),
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Text(
                                  widget.searchItem?.offerPrice ?? " 200",
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
                  right: RouteUtils.isAR ? 12.w : 12.w,

                  top: -18.h,
                  child: SizedBox(
                    width: 130.w,
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
                                  "product_id": widget.searchItem?.id,
                                  "like": _isFavourite,
                                },
                              ));
                            },
                            child: Container(
                              // width: 70.w,
                              // height: 60.h,
                              color: Colors.transparent,
                              child: Image.asset(
                                _isFavourite
                                    ? favouriteImage
                                    : notFavouriteImage,
                              ),
                            )),
                        const Spacer(
                            // flex: 8,
                            ),
                        widget.searchItem?.discount == '0' ||
                                widget.searchItem?.discount == null
                            ? const SizedBox()
                            : CircleAvatar(
                                backgroundColor: ColorStyles.orangeColor,
                                radius: 20.r,
                                child: Column(
                                  children: [
                                    Text(widget.searchItem?.discount ?? '10',
                                        style: TextStyles.textstyle12.copyWith(
                                            color: Colors.white,
                                            fontSize: 9.sp,
                                            fontWeight: FontWeight.bold)),
                                    Text('خصم',
                                        style: TextStyles.textstyle12.copyWith(
                                            color: Colors.white,
                                            fontSize: 7.sp)),
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
      ),
    );
  }
}
