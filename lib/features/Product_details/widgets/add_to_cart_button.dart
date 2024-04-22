import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/features/Product_details/bloc/product_details_bloc.dart';
import 'package:kian_sheeps_projects/features/cart/bloc/cart_bloc.dart';
import 'package:kian_sheeps_projects/main_models/product_model.dart';
import '../../cart/views/cart_view.dart';
import '../../../helper/assets.dart';
import '../../../helper/color_styles.dart';
import '../../../helper/navigation_methods.dart';
import '../../../helper/text_styles.dart';

class AddToCartButton extends StatefulWidget {
  const AddToCartButton({
    super.key,
    this.productDetailsModel,
    required this.offerId,
    // required this.price,
  });
  final String offerId;
  final ProductModel? productDetailsModel;

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  // int offerPriceInt = 180;
  // int quantity = 1;
  // @override
  // void initState() {
  //   int? offerPriceInt =
  //       int.tryParse(widget.productDetailsModel?.offerPrice ?? '');
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    var bloc = ProductDetailsBloc.of(context);
    bloc.offerId = widget.offerId;
    // int? quantity = widget.productDetailsModel?.quantity ?? 1;
    // int price = int.parse(widget.productDetailsModel?.offerPrice ?? '1');

    // var price = removeHash(widget.productDetailsModel?.offerPrice ?? '0');

    return GestureDetector(
      onTap: () {
        log('offer  id ${bloc.offerId}');
        log(' size id ${bloc.sizeId}');
        log('quantity   id     ${bloc.quantity}');
        log('cutting   id   ${bloc.cuttingId}');
        log(' addtition  id  ${bloc.addition}');
        log('orderType  id   ${bloc.orderTypeId}');

        ProductDetailsBloc.of(context).add(Click(arguments: {
          "offer_id": bloc.offerId,
          "quantity": bloc.quantity,
          "order_type_id": bloc.orderTypeId,
          "size_id": bloc.sizeId,
          "wrapping_id": bloc.wrappingId,
          "cutting_id": bloc.cuttingId,
          "addition[]": bloc.addition,
          "excute_time": DateTime.now().toString(),
        }));
      },
      child: Container(
        height: 66.h,
        width: 324.w,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: GestureDetector(
            onTap: () {
              CartBloc.of(context).add(Get());

              navigateTo(context: context, widget: const CartView());
            },
            child: Row(
              children: [
                Image.asset(AssetsData.shoppingBasket,
                    height: 24.h, width: 24.w, color: Colors.white),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "add_to_cart".tr(),
                  //     //textdirection: TextDirection.rtl,
                  style: TextStyles.textstyle16.copyWith(color: Colors.white),
                ),
                const Spacer(),
                Text(
                  '180.00',
                  // "${offerPriceInt * quantity} ",
                  //   //textdirection: TextDirection.rtl,
                  style: TextStyles.textstyle16.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
