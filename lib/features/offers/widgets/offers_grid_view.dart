import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/offers/bloc/all_offer_bloc.dart';
import 'package:kian_sheeps_projects/widgets/custom_product_item.dart';

class OffersGridView extends StatelessWidget {
  const OffersGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = AllOffersBloc.of(context);

    return SliverFillRemaining(
      child: GridView.builder(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 6.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2 / 3,
          crossAxisCount: 2,
          crossAxisSpacing: 2.w,
          mainAxisSpacing: 2.h,
        ),
        itemCount: bloc.allOffersData.data!.offers!.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomProductCard(
            offer: bloc.allOffersData.data!.offers![index],
            isFavourite: bloc.allOffersData.data?.offers?[index].like ?? false,
          );
        },
      ),
    );
  }
}
