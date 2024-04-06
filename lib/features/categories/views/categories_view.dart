import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/categories/bloc/categories_bloc.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';
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
      body: BlocBuilder<CategoriesBloc, AppState>(
        builder: (context, state) {
          final bloc = CategoriesBloc.of(context);

          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Done) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 1.w,
              ),
              child: CustomScrollView(
                slivers: [
                  CategoryTitle(
                    categoryName: bloc.subCategoryData.data!.name,
                  ),
                  SubCategoryListView(
                    subCategory: bloc.subCategoryData.data!.subCategory,
                  ),
                  const ProductGridView(),
                ],
              ),
            );
          } else if (state is Error) {
            return Center(
                child: Text(
              "error_getting_data".tr(),
              style: TextStyles.textstyle16,
            ));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
