import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.price,
    required this.oldPrice,
    required this.productName,
    required this.imageUrl,
    required this.categoryName,
    required this.cardWidth,
    required this.cardHeight,
  });
  final String categoryName;
  final String price;
  final String oldPrice;
  final String productName;
  final String imageUrl;
  final double cardWidth;
  final double cardHeight;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cardWidth,
      width: cardHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: 150.w,
            height: 150.h,
            child: Image.asset(imageUrl),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            categoryName,
            style: TextStyles.textstyle14
                .copyWith(color: ColorStyles.textGreyColor),
          ),
          SizedBox(
            height: 6.h,
          ),
          Text(
            price,
            style: TextStyles.textstyle14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(Icons.shopping_bag_outlined),
              SizedBox(
                width: 25.w,
              ),
              Text(
                '$price SR',
                style: TextStyles.textstyle14.copyWith(
                  color: kPrimaryColor,
                ),
              ),
              SizedBox(
                width: 6.w,
              ),
              Text(
                '$oldPrice SR',
                style: TextStyles.textstyle14.copyWith(
                    color: ColorStyles.textGreyColor,
                    decoration: TextDecoration.lineThrough,
                    decorationThickness: 2.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}