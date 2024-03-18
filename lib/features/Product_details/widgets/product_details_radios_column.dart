import 'package:flutter/material.dart';
import 'package:kian_sheeps_projects/features/Product_details/widgets/expandable_container.dart';
import 'package:kian_sheeps_projects/features/Product_details/widgets/product_chopping_radio.dart';
import 'package:kian_sheeps_projects/features/Product_details/widgets/product_packaging_radios.dart';
import 'package:kian_sheeps_projects/features/Product_details/widgets/product_type_radio.dart';

class ProductDeitailsRadiosColumn extends StatelessWidget {
  const ProductDeitailsRadiosColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ProductTypeRadios(),
        ExpandableContainer(),
        ProductpackagingRadios(),
        ProductchoppingRadios(),
      ],
    );
  }
}
