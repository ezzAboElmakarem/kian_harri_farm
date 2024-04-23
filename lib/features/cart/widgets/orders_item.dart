import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/features/cart/bloc/cart_bloc.dart';
import 'package:kian_sheeps_projects/features/cart/model/cart_model.dart';
import '../../../helper/assets.dart';
import '../../../helper/color_styles.dart';
import '../../../helper/text_styles.dart';

class OrderItem extends StatefulWidget {
  const OrderItem({
    super.key,
    required this.cartData,
    required this.itemData,
  });
  final Cart cartData;
  final Cart? itemData;

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  int numOfOrders = 1;
  @override
  void initState() {
    numOfOrders = int.parse(widget.cartData.quantity ?? '1');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 95.h,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // height: 100.h,
            width: 76.w,
            decoration: BoxDecoration(
                // image: const DecorationImage(
                //     fit: BoxFit.cover,
                //     image: AssetImage(
                //       AssetsData.productDetails,
                //     )),
                borderRadius: BorderRadius.circular(25)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                widget.cartData.image ?? AssetsData.dummyProductImage,
              ),
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      widget.cartData.name ?? 'فريش بيف استربس',
                      style: TextStyles.textstyle14,
                      //textdirection:    isArabic() ? TextDirection.rtl : TextDirection.ltr,
                    ),
                    // const Spacer(),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    widget.cartData.description ??
                        'هذا النص هو مثال لنص يمكن أن يستبدل في ',
                    style: TextStyles.textstyle12
                        .copyWith(color: ColorStyles.textGreyColor),
                    //textdirection: isArabic() ? TextDirection.rtl : TextDirection.ltr,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    Text(
                      widget.cartData.price ?? '150.00   LE',
                      style: TextStyles.textstyle14,
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    IconButton(
                        onPressed: () {
                          log("${widget.itemData?.id}");
                          CartBloc.of(context)
                              .add(Delete(arguments: widget.cartData.id));
                        },
                        icon: const Icon(Icons.delete_outline)),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              CartBloc.of(context).add(Click(
                                arguments: widget.cartData.id,
                              ));
                              if (numOfOrders > 1) {
                                numOfOrders--;
                                log("numOfOrders -- $numOfOrders");
                                setState(() {});
                              }
                            },
                            child: Image.asset(AssetsData.mininizeIcon)),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          // height: 25.h,
                          // width: 30.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              widget.itemData?.quantity ?? '$numOfOrders',
                              style: TextStyles.textstyle16
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        GestureDetector(
                            onTap: () {
                              CartBloc.of(context).add(Add(
                                arguments: widget.itemData?.id,
                              ));
                              numOfOrders++;
                              log("numOfOrders ++ $numOfOrders");

                              setState(() {});
                            },
                            child: Image.asset(AssetsData.maximizeIcon)),
                        SizedBox(
                          width: 5.w,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
