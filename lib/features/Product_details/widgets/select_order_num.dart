import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/Product_details/bloc/product_details_bloc.dart';
import 'package:kian_sheeps_projects/features/Product_details/model/product_details_model.dart';
import '../../../helper/assets.dart';
import '../../../helper/color_styles.dart';
import '../../../helper/text_styles.dart';

class SelectOrderNum extends StatefulWidget {
  const SelectOrderNum({super.key, required this.productDetailsModel});
  final ProductDetailsModel? productDetailsModel;

  @override
  State<SelectOrderNum> createState() => _SelectOrderNumState();
}

class _SelectOrderNumState extends State<SelectOrderNum> {
  int numOfOrders = 1;

  @override
  Widget build(BuildContext context) {
    var bloc = ProductDetailsBloc.of(context);
    bloc.quantity = numOfOrders.toString();
    return Row(
      children: [
        Text(
          widget.productDetailsModel?.data?.offer?.name ?? 'فريش بيف استربس',
          style: TextStyles.textstyle16.copyWith(fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            numOfOrders++;
            setState(() {
              bloc.quantity = numOfOrders.toString();
            });
          },
          child: Image.asset(AssetsData.maximizeContainer),
        ),
        SizedBox(
          width: 5.w,
        ),
        Container(
          height: 37.h,
          width: 44.w,
          decoration: BoxDecoration(
              color: kPrimaryColor,
              border: Border.all(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: Text(
              '$numOfOrders',
              style: TextStyles.textstyle16.copyWith(color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        GestureDetector(
            onTap: () {
              if (numOfOrders == 1) {
              } else {
                numOfOrders--;
                setState(() {});
              }
            },
            child: Image.asset(AssetsData.minimizeContainer)),
      ],
    );
  }
}
