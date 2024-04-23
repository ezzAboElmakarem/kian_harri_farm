import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/Product_details/bloc/product_details_bloc.dart';
import '../widgets/add_to_cart_button.dart';
import '../widgets/extra_services_drop_down.dart';
import '../widgets/product_chopping_radio.dart';
import '../widgets/product_info.dart';
import '../widgets/product_packaging_radios.dart';
import '../widgets/order_type_radio.dart';
import '../widgets/similar_products_slider.dart';
import '../widgets/product_review.dart';
import '../../../helper/app_bar_method.dart';
import '../../../helper/assets.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context: context,
          title: 'product_details'.tr(),
          actions: [
            GestureDetector(
                onTap: () {
                  // CartBloc.of(context).add(Get());

                  // navigateTo(context: context, widget: const CartView());
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
                  child: Image.asset(
                    AssetsData.shoppingBasket,
                    height: 24.h,
                    width: 24.w,
                  ),
                )),
          ]),
      body: BlocBuilder<ProductDetailsBloc, AppState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final bloc = ProductDetailsBloc.of(context);

            log(bloc.productDetailsData.data?.offer?.similarProduct?[0].name
                    .toString() ??
                "dummmy");
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductInfo(
                          productDetailsModel: bloc.productDetailsData,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        OrderTypeRadios(
                          productDetailsModel: bloc.productDetailsData,
                        ),
                        ExtraServicesDropDown(
                          productDetailsModel: bloc.productDetailsData,
                        ),
                        ProductpackagingRadios(
                          productDetailsModel: bloc.productDetailsData,
                        ),
                        ProductchoppingRadios(
                          productDetailsModel: bloc.productDetailsData,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        const ProductReview(),
                        SizedBox(
                          height: 16.h,
                        ),
                        SimilarProductsSlider(
                          productDetailsModel: bloc.productDetailsData,
                        ),
                        SizedBox(
                          height: 88.h,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    left: 25.w,
                    right: 25.w,
                    bottom: 16.w,
                    child: AddToCartButton(
                      productDetailsModel: bloc.productDetailsData,
                      offerId:
                          bloc.productDetailsData.data?.offer?.id.toString() ??
                              "dummy",
                    )),
              ],
            );
          }
        },
      ),
    );
  }
}
