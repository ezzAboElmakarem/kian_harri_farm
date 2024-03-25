import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/is_arabic_method.dart';
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
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'فريش بيف استربس',
                style: TextStyles.textstyle14,
                //textdirection:    isArabic() ? TextDirection.rtl : TextDirection.ltr,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                'هذا النص هو مثال لنص يمكن أن يستبدل في ',
                style: TextStyles.textstyle12
                    .copyWith(color: ColorStyles.textGreyColor),
                //textdirection: isArabic() ? TextDirection.rtl : TextDirection.ltr,
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            numOfOrders++;
                            setState(() {});
                          },
                          child: Image.asset(AssetsData.maximizeIcon)),
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
                      InkWell(
                          onTap: () {
                            if (numOfOrders == 0) {
                            } else {
                              numOfOrders--;
                              setState(() {});
                            }
                          },
                          child: Image.asset(AssetsData.mininizeIcon)),
                      // Stack(
                      //   children: [
                      //     GestureDetector(
                      //       onTap: () {
                      // if (numOfOrders == 0) {
                      // } else {
                      //   numOfOrders--;
                      //   setState(() {});
                      // }
                      //       },
                      //       child: Container(
                      //         height: 26.h,
                      //         width: 24.w,
                      //         decoration: BoxDecoration(
                      //             border: Border.all(color: kPrimaryColor),
                      //             borderRadius: BorderRadius.circular(16)),
                      //       ),
                      //     ),
                      //     Positioned(
                      //       bottom: 0.5.h,
                      //       left: 7.w,
                      //       child: Text(
                      //         '-',
                      //         style: TextStyles.textstyle20,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                  SizedBox(
                    width: 112.w,
                  ),
                  Text(
                    '150.00   LE',
                    style: TextStyles.textstyle14,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            width: 8.w,
          ),
          Expanded(
            child: Container(
              height: 80.h,
              width: 76.w,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        AssetsData.productDetails,
                      )),
                  borderRadius: BorderRadius.circular(11)),
            ),
          ),
        ],
      ),
    );
  }
}
