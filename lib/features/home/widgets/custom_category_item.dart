import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/features/categories/bloc/categories_bloc.dart';
import '../../categories/views/categories_view.dart';
import '../../../helper/navigation_methods.dart';
import '../../../helper/text_styles.dart';

class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({
    super.key,
    required this.categoryColor,
    required this.categoryImage,
    required this.categoryName,
    required this.catId,
  });

  final Color categoryColor;
  final String categoryImage;
  final String categoryName;
  final String catId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: GestureDetector(
        onTap: () {
          CategoriesBloc.of(context).add(Get(arguments: catId));
          // CategoriesBloc.of(context).add(Default());
          navigateTo(
            context: context,
            widget: const CategoriesScreenView(),
          );
        },
        child: Container(
          width: 70.w,
          height: 100.h,
          decoration: BoxDecoration(
              color: categoryColor, borderRadius: BorderRadius.circular(12.r)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10000),
                child: Container(
                  width: 44.w,
                  height: 44.w,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(categoryImage),
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 10.h,
              // ),
              Text(
                categoryName,
                style: TextStyles.textstyle14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
