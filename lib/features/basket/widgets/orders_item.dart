import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class OrderItem extends StatefulWidget {
  const OrderItem({
    super.key,
  });

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  int numOfOrders = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95.h,
      width: 340.w,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('فريش بيف استربس',
                  style: TextStyles.textstyle14,
                  textDirection: TextDirection.rtl),
              SizedBox(
                height: 8.h,
              ),
              Text('هذا النص هو مثال لنص يمكن أن يستبدل في ',
                  style: TextStyles.textstyle14,
                  textDirection: TextDirection.rtl),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              numOfOrders++;
                              setState(() {});
                            },
                            child: Container(
                              height: 26.h,
                              width: 24.w,
                              decoration: BoxDecoration(
                                  border: Border.all(color: kPrimaryColor),
                                  borderRadius: BorderRadius.circular(16)),
                            ),
                          ),
                          Positioned(
                            bottom: 1.5.h,
                            left: 6.w,
                            child: Text(
                              '+',
                              style: TextStyles.textstyle20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Container(
                        height: 25.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text(
                            '$numOfOrders',
                            style: TextStyles.textstyle16
                                .copyWith(color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (numOfOrders == 0) {
                              } else {
                                numOfOrders--;
                                setState(() {});
                              }
                            },
                            child: Container(
                              height: 26.h,
                              width: 24.w,
                              decoration: BoxDecoration(
                                  border: Border.all(color: kPrimaryColor),
                                  borderRadius: BorderRadius.circular(16)),
                            ),
                          ),
                          Positioned(
                            bottom: 0.5.h,
                            left: 7.w,
                            child: Text(
                              '-',
                              style: TextStyles.textstyle20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 112.w,
                  ),
                  Text('150.00   LE',
                      style: TextStyles.textstyle14,
                      textDirection: TextDirection.rtl),
                ],
              ),
            ],
          ),
          SizedBox(
            width: 10.w,
          ),
          Container(
            height: 70.h,
            width: 64.w,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      AssetsData.productDetails,
                    )),
                borderRadius: BorderRadius.circular(11)),
          ),
        ],
      ),
    );
  }
}
