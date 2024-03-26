import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: customAppBar(context: context, title: 'العروض'),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: ProductSlider(imageViewPoint: 0.9, imagesUrl: imagesUrl)),
          const OffersGridView(),
        ],
      ),
    );
  }
}
