import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/Product_details/widgets/custom_positioned_button.dart';
import 'package:kian_sheeps_projects/features/Product_details/widgets/product_details_radios_column.dart';
import 'package:kian_sheeps_projects/features/Product_details/widgets/product_image.dart';
import 'package:kian_sheeps_projects/features/Product_details/widgets/product_info_body.dart';
import 'package:kian_sheeps_projects/features/Product_details/widgets/similar_products_slider.dart';
import 'package:kian_sheeps_projects/features/Product_details/widgets/user_review_column.dart';
import 'package:kian_sheeps_projects/helper/app_bar_method.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: 'تفاصيل المنتج',
        leading: const Icon(Icons.shopping_bag_outlined),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const ProductImage(),
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
                    const ProductDeitailsRadiosColumn(),
                    SizedBox(
                      height: 20.h,
                    ),
                    const UserReviewColumn(),
                    SizedBox(
                      height: 16.h,
                    ),
                    const SimilarProductsSlider(),
                    SizedBox(
                      height: 16.h,
                    ),
                  ],
                ),
              ),
            ),
            const CustomPositionedButton(price: 160),
          ],
        ),
      ),
    );
  }
}
