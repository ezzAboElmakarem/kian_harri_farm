import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/home/bloc/home_bloc.dart';
import 'custom_category_item.dart';
import '../../../helper/is_arabic_method.dart';
import '../../../helper/text_styles.dart';

class CustomCategoryListView extends StatelessWidget {
  const CustomCategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var bloc = HomeBloc.get(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Text(
            "categories".tr(),
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
            itemCount: bloc.homeData.category!.length,
            itemBuilder: (context, index) {
              String colorString = bloc.homeData.category![index].color!;
              int colorValue = int.parse(colorString.substring(1), radix: 16);
              Color color = Color(0xFF000000 + colorValue);
              return CustomCategoryItem(
                  categoryColor: color,
                  catId: bloc.homeData.category![index].id.toString(),
                  categoryImage: bloc.homeData.category![index].image!,
                  categoryName: bloc.homeData.category![index].name!);
            },
          ),
        ),
      ],
    );
  }
}
