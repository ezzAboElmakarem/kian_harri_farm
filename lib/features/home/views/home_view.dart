import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/drawer/views/drawer_view.dart';
import 'package:kian_sheeps_projects/features/home/widgets/custom_app_bar.dart';
import 'package:kian_sheeps_projects/features/home/widgets/custom_category_list_view.dart';
import 'package:kian_sheeps_projects/features/home/widgets/offers_list_view.dart';
import 'package:kian_sheeps_projects/features/home/widgets/product_slider.dart';
import 'package:kian_sheeps_projects/features/home/widgets/search_bar.dart';
import 'package:kian_sheeps_projects/features/home/widgets/welcome_title.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/widgets/logo_image_widget.dart';

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
      key: scaffoldkey,
      endDrawer: const Drawer(
        child: DrawerView(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomHomeAppBar(scaffoldkey: scaffoldkey),
              const HomeWelocmeTitle(),
              const CustomSearchBar(),
              ProductSlider(imageViewPoint: 0.9, imagesUrl: imagesUrl),
              const CustomCategoryListView(),
              SizedBox(
                height: 16.h,
              ),
              const OffersListView(),
              SizedBox(
                height: 16.h,
              ),
              Divider(
                height: 2.0,
                thickness: 2.0,
                color: Colors.black.withOpacity(0.2),
              ),
              ProductSlider(
                imageViewPoint: 0.88,
                imagesUrl: secondImagesUrl,
              ),
              SizedBox(
                height: 20.h,
              ),
              const LogoImageWidget(
                height: 100,
                width: 100,
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
