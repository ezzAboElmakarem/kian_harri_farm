import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/Product_details/bloc/product_details_bloc.dart';
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
    // required this.categoryName,
    // required this.price,
    // required this.oldPrice,
    // required this.productName,
    // required this.imageUrl,
  });
  final ProductModel? offer;
  final bool isFavourite;
  // final String categoryName;
  // final String price;
  // final String oldPrice;
  // final String productName;
  // final String imageUrl;

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
    return InkWell(
      onTap: () {
        ProductDetailsBloc.of(context)
            .add(Get(arguments: widget.offer?.id ?? ''));
        navigateTo(
            context: context,
            widget: ProductDetailsView(productDetailsModel: widget.offer));
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
            BlocBuilder<FavouriteBloc, AppState>(builder: (context, state) {
              if (state is Loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is Error) {
                return Center(
                    child: Text(
                  "error_getting_data".tr(),
                  style: TextStyles.textstyle16,
                ));
              } else {
                return Positioned(
                  left: RouteUtils.isAR ? 0 : null,
                  right: RouteUtils.isAR ? null : 0,
                  top: -12.h,
                  child: Row(
                    children: [
                      InkWell(
                          splashColor: Colors.transparent,
                          onTap: () {
                            _isFavourite = !_isFavourite;
                            log('state is : $_isFavourite');
                            setState(() {});
                            FavouriteBloc.get(context).add(Click(
                              arguments: {
                                "product_id": widget.offer?.id,
                                "like": _isFavourite,
                              },
                            ));
                          },
                          child: Container(
                            width: 70.w,
                            height: 60.h,
                            color: Colors.transparent,
                            child: Image.asset(
                              _isFavourite ? favouriteImage : notFavouriteImage,
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
                                style: TextStyles.textstyle12.copyWith(
                                    color: Colors.white, fontSize: 8.sp)),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
