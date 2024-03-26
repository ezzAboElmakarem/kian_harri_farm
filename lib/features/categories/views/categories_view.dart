import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/category_title.dart';
import '../widgets/product_grid_view.dart';
import '../widgets/category_sort_by_sheet.dart';
import '../widgets/sub_category_list_view.dart';
import '../../../helper/app_bar_method.dart';
import '../../../helper/assets.dart';
import '../../../helper/bottom_sheet_method.dart';

class CategoriesScreenView extends StatelessWidget {
  const CategoriesScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: 'categories'.tr(),
        leading: GestureDetector(
          onTap: () {
            bottomSheetMethod(
                context: context,
                bottomSheetContent: const SortBySheet(),
                height: MediaQuery.of(context).size.height * .45);
          },
          child: Image.asset(AssetsData.sortIcon),
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
