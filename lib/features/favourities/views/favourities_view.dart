import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/AppStorage.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/favourities/bloc/favourite_bloc.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';
import 'package:kian_sheeps_projects/widgets/custom_product_card.dart';
import 'package:kian_sheeps_projects/widgets/empty_data_view.dart';
import '../../../helper/app_bar_method.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = FavouriteBloc.get(context);

    return Scaffold(
      appBar: customAppBar(context: context, title: 'favourite'.tr()),
      body: BlocBuilder<FavouriteBloc, AppState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Unauthorized) {
            return Column(
              children: [
                const EmptyDataScreen(),
                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: () {
                    AppStorage.signOut();
                  },
                  child: Text(
                    "login".tr(),
                    style:
                        TextStyles.textstyle14.copyWith(color: kPrimaryColor),
                  ),
                )
              ],
            );
          } else if (state is Empty) {
            return const EmptyDataScreen();
          } else if (state is Error) {
            return Center(child: Text('error_getting_data'.tr()));
          } else if (bloc.favouriteData.data!.product!.isEmpty) {
            return Center(child: Text('error_getting_data'.tr()));
          } else {
            return GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 26.h),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: .9 / 1,
                crossAxisCount: 2,
                crossAxisSpacing: 2.w,
                mainAxisSpacing: 16.h,
              ),
              itemCount: bloc.favouriteData.data!.product!.length,
              itemBuilder: (context, index) => Center(
                child: CustomProductCard(
                  offer: bloc.favouriteData.data!.product![index],
                  isFavourite:
                      bloc.favouriteData.data?.product?[index].like ?? false,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
