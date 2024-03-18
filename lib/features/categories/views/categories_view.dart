import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/categories/widgets/category_title.dart';
import 'package:kian_sheeps_projects/features/categories/widgets/product_grid_view.dart';
import 'package:kian_sheeps_projects/features/categories/widgets/category_sort_by_sheet.dart';
import 'package:kian_sheeps_projects/features/categories/widgets/sub_category_list_view.dart';
import 'package:kian_sheeps_projects/helper/app_bar_method.dart';
import 'package:kian_sheeps_projects/helper/bottom_sheet_method.dart';

class CategoriesScreenView extends StatelessWidget {
  const CategoriesScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: 'الأقسام',
        leading: GestureDetector(
          onTap: () {
            bottomSheetMethod(
                context: context,
                bottomSheetContent: const SortBySheet(),
                height: MediaQuery.of(context).size.height * .45);
          },
          child: const Icon(Icons.sort_rounded),
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
