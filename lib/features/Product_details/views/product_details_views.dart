import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/add_to_cart_button.dart';
import '../widgets/extra_services_drop_down.dart';
import '../widgets/product_chopping_radio.dart';
import '../widgets/product_info.dart';
import '../widgets/product_packaging_radios.dart';
import '../widgets/product_type_radio.dart';
import '../widgets/similar_products_slider.dart';
import '../widgets/product_review.dart';
import '../../cart/views/cart_view.dart';
import '../../../helper/app_bar_method.dart';
import '../../../helper/assets.dart';
import '../../../helper/navigation_methods.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: 'product_details'.tr(),
        leading: GestureDetector(
            onTap: () {
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
                  const ProductInfo(
                    oldProductPrice: 170,
                    productPrice: 200,
                    productType: "الطليان",
                    productWeight: 50,
                    productDescription:
                        'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى أيضا',
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const ProductTypeRadios(),
                  const ExtraServicesDropDown(),
                  const ProductpackagingRadios(),
                  const ProductchoppingRadios(),
                  SizedBox(
                    height: 20.h,
                  ),
                  const ProductReview(),
                  SizedBox(
                    height: 16.h,
                  ),
                  const SimilarProductsSlider(),
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
              child: const AddToCartButton(price: 160)),
        ],
      ),
    );
  }
}
