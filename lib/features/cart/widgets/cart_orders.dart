import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/features/cart/bloc/cart_bloc.dart';
import 'package:kian_sheeps_projects/features/cart/model/cart_model.dart';
import 'orders_item.dart';
import '../../offers/views/all_offers_view.dart';
import '../../../helper/color_styles.dart';
import '../../../helper/navigation_methods.dart';
import '../../../helper/text_styles.dart';

class CartOrders extends StatelessWidget {
  const CartOrders({
    super.key,
    required this.cartDataModel,
    required this.itemData,
  });
  final CartModel cartDataModel;
  final CartModel? itemData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              cartDataModel.data?.cart?.length.toString() ?? "test",
              style:
                  TextStyles.textstyle14.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              "products".tr(),
              //textdirection: isArabic() ? TextDirection.rtl : TextDirection.ltr,
              style:
                  TextStyles.textstyle14.copyWith(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                navigateTo(context: context, widget: OffersView());
              },
              child: GestureDetector(
                onTap: () {
                  CartBloc.of(context).add(Clear());
                },
                child: Text(
                  "clear_cart".tr(),
                  style: TextStyles.textstyle14.copyWith(color: kPrimaryColor),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 23.h,
        ),
        SizedBox(
          width: double.infinity,
          child: ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => OrderItem(
                  cartData: cartDataModel.data!.cart![index],
                  itemData: itemData?.data?.cart?[index]),
              separatorBuilder: (context, index) => SizedBox(height: 20.h),
              itemCount: cartDataModel.data?.cart?.length ?? 0),
        ),
      ],
    );
  }
}
