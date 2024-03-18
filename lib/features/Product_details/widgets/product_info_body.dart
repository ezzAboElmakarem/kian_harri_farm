import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/Product_details/widgets/product_description.dart';
import 'package:kian_sheeps_projects/features/Product_details/widgets/product_prices_row.dart';
import 'package:kian_sheeps_projects/features/Product_details/widgets/product_type_row.dart';
import 'package:kian_sheeps_projects/features/Product_details/widgets/product_weight_row.dart';
import 'package:kian_sheeps_projects/features/Product_details/widgets/select_order_num_row.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key,
    required this.productPrice,
    required this.oldProductPrice,
    required this.productType,
    required this.productWeight,
    required this.productDescription,
  });
  final int productPrice;
  final int oldProductPrice;
  final String productType;
  final int productWeight;
  final String productDescription;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          textAlign: TextAlign.right,
          'لحوم',
          style: TextStyles.textstyle12.copyWith(color: kPrimaryColor),
        ),
        SizedBox(
          height: 7.h,
        ),
        const SelectOrderNumRow(),
        ProductPricesRow(
            productPrice: productPrice, oldProductPrice: oldProductPrice),
        SizedBox(
          height: 14.h,
        ),
        ProductType(productType: productType),
        SizedBox(
          height: 14.h,
        ),
        ProductWeight(productWeight: productWeight),
        SizedBox(
          height: 20.h,
        ),
        ProductDescription(productDescription: productDescription),
      ],
    );
  }
}
