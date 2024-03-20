import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/Product_details/widgets/add_to_basket_button.dart';
import 'package:kian_sheeps_projects/features/Product_details/widgets/extra_services_drop_down.dart';
import 'package:kian_sheeps_projects/features/Product_details/widgets/product_chopping_radio.dart';
import 'package:kian_sheeps_projects/features/Product_details/widgets/product_info.dart';
import 'package:kian_sheeps_projects/features/Product_details/widgets/product_packaging_radios.dart';
import 'package:kian_sheeps_projects/features/Product_details/widgets/product_type_radio.dart';
import 'package:kian_sheeps_projects/features/Product_details/widgets/similar_products_slider.dart';
import 'package:kian_sheeps_projects/features/Product_details/widgets/product_review.dart';
import 'package:kian_sheeps_projects/features/basket/views/basket_view.dart';
import 'package:kian_sheeps_projects/helper/app_bar_method.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/navigation_methods.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: 'تفاصيل المنتج',
        leading: GestureDetector(
            onTap: () {
              navigateTo(context: context, widget: const BasketView());
            },
            child: Image.asset(AssetsData.shoppingBasket)),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
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
              child: const AddToBasketButton(price: 160)),
        ],
      ),
    );
  }
}
