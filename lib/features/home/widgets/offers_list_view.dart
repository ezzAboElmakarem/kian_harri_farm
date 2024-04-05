import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/features/home/bloc/home_bloc.dart';
import 'package:kian_sheeps_projects/features/offers/bloc/all_offer_bloc.dart';
import 'package:kian_sheeps_projects/helper/is_arabic_method.dart';
import '../../../widgets/custom_product_item.dart';
import '../../offers/views/all_offers_view.dart';
import '../../../helper/color_styles.dart';
import '../../../helper/navigation_methods.dart';
import '../../../helper/text_styles.dart';

class OffersListView extends StatelessWidget {
  const OffersListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var bloc = HomeBloc.get(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "offers".tr(),
                  style: TextStyles.textstyle14
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    final bloc = AllOffersBloc.of(context);
                    bloc.add(Get());
                    navigateTo(context: context, widget: OffersView());
                  },
                  child: Text(
                    "show_more".tr(),
                    style:
                        TextStyles.textstyle14.copyWith(color: kPrimaryColor),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 23.h,
          ),
          SizedBox(
            height: 240.h,
            child: ListView.separated(
                itemCount: bloc.homeData.offer!.length,
                reverse: isArabic() ? true : false,
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(width: 2.w),
                itemBuilder: (context, index) {
                  return CustomProductCard(
                    offer: bloc.homeData.offer![index],
                  );
                }),
          ),
          /*
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProductCard(
                  price: '160',
                  oldPrice: '200',
                  productName: 'سمك فريش',
                  imageUrl: AssetsData.fishOffer),
              ProductCard(
                  price: '200',
                  oldPrice: '230',
                  productName: 'فريش بيف استربس',
                  imageUrl: AssetsData.meatOffers),
            ],
          ),
          */
        ],
      ),
    );
  }
}
