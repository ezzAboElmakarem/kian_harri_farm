import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/home/bloc/home_bloc.dart';
import 'package:kian_sheeps_projects/features/home/widgets/home_advert.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';
import '../../drawer/views/drawer_view.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_category_list_view.dart';
import '../widgets/offers_list_view.dart';
import '../widgets/product_slider.dart';
import '../widgets/search_bar.dart';
import '../widgets/welcome_title.dart';
import '../../../helper/assets.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final imagesUrl = [
    Image.asset(
      AssetsData.meatBigPic,
    ),
    Image.asset(AssetsData.meatBigPic),
    Image.asset(AssetsData.meatBigPic),
  ];

  final secondImagesUrl = [
    Image.asset(
      AssetsData.meatBigPic,
    ),
    Image.asset(AssetsData.meatBigPic),
    Image.asset(AssetsData.meatBigPic),
    Image.asset(
      AssetsData.meatBigPic,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

    return Scaffold(
      appBar: CustomHomeAppBar(scaffoldkey: scaffoldkey),
      key: scaffoldkey,
      drawer: Drawer(
        child: DrawerView(),
      ),
      body: BlocBuilder<HomeBloc, AppState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Done) {
            return HomeBuildItem(
                imagesUrl: imagesUrl, secondImagesUrl: secondImagesUrl);
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

class HomeBuildItem extends StatelessWidget {
  const HomeBuildItem({
    super.key,
    required this.imagesUrl,
    required this.secondImagesUrl,
  });

  final List<Image> imagesUrl;
  final List<Image> secondImagesUrl;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const HomeWelocmeTitle(),
            const CustomSearchBar(),
            SizedBox(
              height: 16.h,
            ),
            const ProductSlider(imageViewPoint: .75),
            SizedBox(height: 20.h),
            const CustomCategoryListView(),
            SizedBox(height: 16.h),
            const OffersListView(),
            SizedBox(
              height: 16.h,
            ),
            Divider(
              height: 2.0,
              thickness: 2.0,
              color: Colors.black.withOpacity(0.2),
            ),
            SizedBox(
              height: 24.h,
            ),
            // const ProductSlider(
            //   imageViewPoint: 0.88,
            // ),
            // SizedBox(
            //   height: 20.h,
            // ),
            // // const LogoImageWidget(
            // //   height: 100,
            // //   width: 100,
            // // ),
            const HomeAdverts(),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
