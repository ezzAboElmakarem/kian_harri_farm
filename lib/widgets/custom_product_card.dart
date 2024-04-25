import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/features/Product_details/bloc/product_details_bloc.dart';
import 'package:kian_sheeps_projects/features/cart/bloc/cart_bloc.dart';
import 'package:kian_sheeps_projects/features/favourities/bloc/favourite_bloc.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:kian_sheeps_projects/main_models/product_model.dart';
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
    required this.isFavourite,
  });
  final ProductModel? offer;
  final bool isFavourite;

  @override
  State<CustomProductCard> createState() => _CustomProductCardState();
}

class _CustomProductCardState extends State<CustomProductCard> {
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
            .add(Get(arguments: widget.offer?.id ?? ''));
        navigateTo(context: context, widget: const ProductDetailsView());
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
                    widget.offer?.image ?? AssetsData.dummyProductImage,
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
                        widget.offer?.category ?? "category",
                        style: TextStyles.textstyle14
                            .copyWith(color: ColorStyles.textGreyColor),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        widget.offer?.name ?? "product",
                        style: TextStyles.textstyle14,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      widget.offer?.price == widget.offer?.offerPrice
                          ? Row(
                              children: [
                                Text(
                                  widget.offer?.offerPrice ?? " 200",
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
                                  widget.offer?.price ?? '250',
                                  style: TextStyles.textstyle14.copyWith(
                                      color: ColorStyles.textGreyColor,
                                      decoration: TextDecoration.lineThrough,
                                      decorationThickness: 2.0),
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Text(
                                  widget.offer?.offerPrice ?? " 200",
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
          Positioned(
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
                        setState(() {
                          _isFavourite = !_isFavourite;
                          log('state is : $_isFavourite');
                          FavouriteBloc.get(context).add(Click(
                            arguments: {
                              "product_id": widget.offer?.id,
                              "like": _isFavourite,
                            },
                          ));
                        });
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
                  widget.offer?.discount == '0' ||
                          widget.offer?.discount == null
                      ? const SizedBox()
                      : CircleAvatar(
                          backgroundColor: ColorStyles.orangeColor,
                          radius: 20.r,
                          child: Column(
                            children: [
                              Text("${widget.offer?.discount}%",
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
          ),

          // BlocBuilder<FavouriteBloc, AppState>(builder: (context, state) {
          //   if (state is Loading) {
          //     return const Center(child: CircularProgressIndicator());
          //   }
          //   // else if (state is Error) {
          //   //   return Center(
          //   //       child: Text(
          //   //     "error_getting_data".tr(),
          //   //     style: TextStyles.textstyle16,
          //   //   ));
          //   // }
          //   else {
          //     return Positioned(
          //       // left: RouteUtils.isAR ? 0 : null,
          //       right: RouteUtils.isAR ? 12.w : 12.w,

          //       top: -18.h,
          //       child: SizedBox(
          //         width: 130.w,
          //         height: 100.h,
          //         child: Row(
          //           children: [
          //             // const Spacer(
          //             //   flex: 1,
          //             // ),
          //             GestureDetector(
          //                 // splashColor: Colors.transparent,
          //                 onTap: () {
          //                   setState(() {
          //                     _isFavourite = !_isFavourite;
          //                     log('state is : $_isFavourite');
          //                     FavouriteBloc.get(context).add(Click(
          //                       arguments: {
          //                         "product_id": widget.offer?.id,
          //                         "like": _isFavourite,
          //                       },
          //                     ));
          //                   });
          //                 },
          //                 child: Container(
          //                   // width: 70.w,
          //                   // height: 60.h,
          //                   color: Colors.transparent,
          //                   child: Image.asset(
          //                     _isFavourite ? favouriteImage : notFavouriteImage,
          //                   ),
          //                 )),
          //             const Spacer(
          //                 // flex: 8,
          //                 ),
          //             widget.offer?.discount == '0' ||
          //                     widget.offer?.discount == null
          //                 ? const SizedBox()
          //                 : CircleAvatar(
          //                     backgroundColor: ColorStyles.orangeColor,
          //                     radius: 20.r,
          //                     child: Column(
          //                       children: [
          //                         Text(widget.offer?.discount ?? '10',
          //                             style: TextStyles.textstyle12.copyWith(
          //                                 color: Colors.white,
          //                                 fontSize: 9.sp,
          //                                 fontWeight: FontWeight.bold)),
          //                         Text('خصم',
          //                             style: TextStyles.textstyle12.copyWith(
          //                                 color: Colors.white, fontSize: 7.sp)),
          //                       ],
          //                     ),
          //                   ),
          //             // const Spacer(
          //             //   flex: 1,
          //             // ),
          //           ],
          //         ),
          //       ),
          //     );

          //     //   return Positioned(
          //     //     left: RouteUtils.isAR ? 0 : null,
          //     //     right: RouteUtils.isAR ? null : 0,
          //     //     top: -12.h,
          //     //     child: Row(
          //     //       children: [
          //     //         SizedBox(
          //     //           width: 64.w,
          //     //         ),
          //     //         CircleAvatar(
          //     //           backgroundColor: ColorStyles.orangeColor,
          //     //           radius: 17.r,
          //     //           child: Column(
          //     //             children: [
          //     //               Text(widget.offer?.discount ?? '10',
          //     //                   style: TextStyles.textstyle12.copyWith(
          //     //                       color: Colors.white,
          //     //                       fontSize: 11.sp,
          //     //                       fontWeight: FontWeight.bold)),
          //     //               Text('خصم',
          //     //                   style: TextStyles.textstyle12.copyWith(
          //     //                       color: Colors.white, fontSize: 8.sp)),
          //     //             ],
          //     //           ),
          //     //         ),
          //     //       ],
          //     //     ),
          //     //   );
          //     // } else {
          //     //   return const SizedBox();
          //     // }
          //   }
          // }),
        ],
      ),
    );
  }
}
