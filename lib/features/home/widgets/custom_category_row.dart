import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/home/widgets/custom_category_item.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class CustomCategoryRow extends StatelessWidget {
  const CustomCategoryRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'الأقسام',
          style: TextStyles.textstyle14.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 8.h,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomCategoryItem(
                  categoryColor: ColorStyles.vegetablesCategoryColor,
                  categoryImage: AssetsData.meatEmoji,
                  categoryName: 'خضراوت'),
              CustomCategoryItem(
                  categoryColor: ColorStyles.fruitsCategoryColor,
                  categoryImage: AssetsData.meatEmoji,
                  categoryName: 'فاكهة'),
              CustomCategoryItem(
                  categoryColor: ColorStyles.fishCategoryColor,
                  categoryImage: AssetsData.meatEmoji,
                  categoryName: 'اسماك'),
              CustomCategoryItem(
                  categoryColor: ColorStyles.meatCategoryColor,
                  categoryImage: AssetsData.meatEmoji,
                  categoryName: 'لحوم'),
            ],
          ),
        ),
      ],
    );
  }
}
