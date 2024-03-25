import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/home/widgets/custom_category_item.dart';
import 'package:kian_sheeps_projects/generated/l10n.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/is_arabic_method.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class CustomCategoryListView extends StatelessWidget {
  const CustomCategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Text(
            S.of(context).categories,
            style: TextStyles.textstyle14.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 90.h,
          width: double.infinity,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            reverse: isArabic() ? true : false,
            separatorBuilder: (context, index) => SizedBox(
              width: 1.h,
            ),
            itemCount: 8,
            itemBuilder: (context, index) => CustomCategoryItem(
                categoryColor: ColorStyles.vegetablesCategoryColor,
                categoryImage: AssetsData.meatEmoji,
                categoryName: 'خضراوت'),
          ),
        ),
      ],
    );
  }
}
