import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../helper/assets.dart';
import '../../../helper/color_styles.dart';
import '../../../helper/text_styles.dart';

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
      // height: 95.h,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
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
          SizedBox(
            width: 8.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                SizedBox(
                  width: 200,
                  child: Text(
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
                      '150.00   LE',
                      style: TextStyles.textstyle14,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              if (numOfOrders == 0) {
                              } else {
                                numOfOrders--;
                                setState(() {});
                              }
                            },
                            child: Image.asset(AssetsData.mininizeIcon)),
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
                              numOfOrders++;
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
