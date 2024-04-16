import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/categories/bloc/category_Items_bloc.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';
import 'package:kian_sheeps_projects/widgets/custom_product_item.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryItemsBloc, AppState>(
      builder: (context, state) {
        var bloc = CategoryItemsBloc.of(context);

        if (state is Loading) {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(
                color: kPrimaryColor,
              ),
            ),
          );
        } else if (state is Error) {
          return SliverToBoxAdapter(
            child: Center(
                child: Text(
              "error_getting_data".tr(),
              style: TextStyles.textstyle16,
            )),
          );
        } else {
          return SliverFillRemaining(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 8.h),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 2.5 / 3,
                crossAxisCount: 2,
                crossAxisSpacing: 0.w,
                mainAxisSpacing: 2.h,
              ),
              itemCount: bloc.subCategoryOffersModel.data?.offer?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return CustomProductCard(
                  isFavourite:
                      bloc.subCategoryOffersModel.data?.offer?[index].like ??
                          false,
                  offer: bloc.subCategoryOffersModel.data!.offer![index],
                );
              },
            ),
          );
        }
      },
    );
  }
}
