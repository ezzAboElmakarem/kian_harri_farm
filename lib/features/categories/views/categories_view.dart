import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/categories/widgets/category_title.dart';
import 'package:kian_sheeps_projects/features/categories/widgets/product_grid_view.dart';
import 'package:kian_sheeps_projects/features/sort_by_bottom_sheet/views/sort_by_sheet.dart';
import 'package:kian_sheeps_projects/features/categories/widgets/sub_category_list_view.dart';
import 'package:kian_sheeps_projects/helper/bottom_sheet_method.dart';

import 'package:kian_sheeps_projects/helper/text_styles.dart';

class CategoriesScreenView extends StatelessWidget {
  const CategoriesScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            bottomSheetMethod(
                context: context,
                bottomSheetContent: const SortBySheet(),
                height: MediaQuery.of(context).size.height * .45);
          },
          child: const Icon(Icons.sort_rounded),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_forward_ios,
                size: 20.sp,
              ),
            ),
          ),
        ],
        centerTitle: true,
        title: Text(
          'الأقسام',
          style: TextStyles.textstyle16,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 1.w,
        ),
        child: const CustomScrollView(
          slivers: [
            CategoryTitle(),
            SubCategoryListView(),
            ProductGridView(),
          ],
        ),
      ),
    );
  }
}
