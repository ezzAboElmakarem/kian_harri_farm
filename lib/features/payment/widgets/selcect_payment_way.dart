import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/payment/widgets/visa_form.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class SelectPaymentWay extends StatefulWidget {
  const SelectPaymentWay({
    super.key,
  });

  @override
  State<SelectPaymentWay> createState() => _SelectPaymentWayState();
}

class _SelectPaymentWayState extends State<SelectPaymentWay> {
  String selectedOption = '';

  @override
  void initState() {
    selectedOption = 'الدفع كاش';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Expanded(
                child: RadioListTile(
                  value: 'الدفع كاش',
                  activeColor: kPrimaryColor,
                  title: Text(
                    'الدفع كاش',
                    textAlign: TextAlign.right,
                    style: TextStyles.textstyle14.copyWith(color: Colors.black),
                  ),
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                  selected: selectedOption == 'الدفع كاش',
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.sp),
                child: Image.asset(
                  AssetsData.cashIcon,
                  height: 22.h,
                  width: 26.w,
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Divider(
              height: 2.0,
              thickness: 2.0,
              color: Colors.black.withOpacity(0.2),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: RadioListTile(
                  value: 'الدفع عن طريق الفيزا',
                  activeColor: kPrimaryColor,
                  title: Text(
                    'الدفع عن طريق الفيزا',
                    textAlign: TextAlign.right,
                    style: TextStyles.textstyle14.copyWith(color: Colors.black),
                  ),
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                  selected: selectedOption == 'الدفع عن طريق الفيزا',
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.sp),
                child: Image.asset(
                  AssetsData.visaIcon,
                  height: 26.h,
                  width: 26.w,
                ),
              )
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          selectedOption == 'الدفع عن طريق الفيزا'
              ? const VisaForm()
              : SizedBox(
                  height: 4.h,
                ),
        ],
      ),
    );
  }
}



/*

*/