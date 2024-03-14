import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/home/widgets/custom_app_bar.dart';
import 'package:kian_sheeps_projects/features/home/widgets/custom_category_row.dart';
import 'package:kian_sheeps_projects/features/home/widgets/product_row.dart';
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
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomHomeAppBar(),
              const HomeWelocmeTitle(),
              const CustomSearchBar(),
              ProductSlider(imageViewPoint: 0.9, imagesUrl: imagesUrl),
              const CustomCategoryRow(),
              const ProductRow(),
              const Divider(
                height: 2.0,
                color: Colors.black,
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
