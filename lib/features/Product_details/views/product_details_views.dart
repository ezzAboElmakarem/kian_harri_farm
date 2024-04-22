import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/features/cart/bloc/cart_bloc.dart';
import 'package:kian_sheeps_projects/main_models/product_model.dart';
import '../widgets/add_to_cart_button.dart';
import '../widgets/extra_services_drop_down.dart';
import '../widgets/product_chopping_radio.dart';
import '../widgets/product_info.dart';
import '../widgets/product_packaging_radios.dart';
import '../widgets/order_type_radio.dart';
import '../widgets/similar_products_slider.dart';
import '../widgets/product_review.dart';
import '../../cart/views/cart_view.dart';
import '../../../helper/app_bar_method.dart';
import '../../../helper/assets.dart';
import '../../../helper/navigation_methods.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, this.productDetailsModel});
  final ProductModel? productDetailsModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: 'product_details'.tr(),
        leading: GestureDetector(
            onTap: () {
              CartBloc.of(context).add(Get());

              navigateTo(context: context, widget: const CartView());
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
              child: Image.asset(
                AssetsData.shoppingBasket,
                height: 24.h,
                width: 24.w,
              ),
            )),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductInfo(
                    productDetailsModel: productDetailsModel,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  OrderTypeRadios(
                    productDetailsModel: productDetailsModel,
                  ),
                  ExtraServicesDropDown(
                    productDetailsModel: productDetailsModel,
                  ),
                  ProductpackagingRadios(
                    productDetailsModel: productDetailsModel,
                  ),
                  ProductchoppingRadios(
                    productDetailsModel: productDetailsModel,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const ProductReview(),
                  SizedBox(
                    height: 16.h,
                  ),
                  SimilarProductsSlider(
                    productDetailsModel: productDetailsModel,
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
                productDetailsModel: productDetailsModel,
                offerId: productDetailsModel?.id.toString() ?? 'x',
              )),
        ],
      ),
    );
  }
}
