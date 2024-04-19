import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/offers/bloc/all_offer_bloc.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';
import 'package:kian_sheeps_projects/widgets/product_slider_image.dart';
import '../../home/widgets/product_slider.dart';
import '../widgets/offers_grid_view.dart';
import '../../../helper/app_bar_method.dart';
import '../../../helper/assets.dart';

class OffersView extends StatelessWidget {
  OffersView({super.key});
  final imagesUrl = [
    Image.asset(
      AssetsData.meatBigPic,
    ),
    Image.asset(AssetsData.meatBigPic),
    Image.asset(AssetsData.meatBigPic),
  ];
  @override
  Widget build(BuildContext context) {
    final bloc = AllOffersBloc.of(context);
    return Scaffold(
      appBar: customAppBar(context: context, title: 'العروض'),
      body: BlocBuilder<AllOffersBloc, AppState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is Done) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: ProductSlider(
                    imageViewPoint: 0.9,
                    list: bloc.allOffersData.data!.banner!.map((banner) {
                      return AppTopViewedCard(imagePath: banner.image!);
                    }).toList(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 28.h),
                ),
                const OffersGridView(),
              ],
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
