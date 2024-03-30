import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/home/views/home_view.dart';
import '../../../helper/color_styles.dart';
import '../../../helper/text_styles.dart';

class AcceptTermsWidget extends StatefulWidget {
  const AcceptTermsWidget({super.key});

  @override
  State<AcceptTermsWidget> createState() => _AcceptTermsWidgetState();
}

class _AcceptTermsWidgetState extends State<AcceptTermsWidget> {
  bool ischecked_1 = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          activeColor: kPrimaryColor,
          value: ischecked_1,
          onChanged: (value) {
            setState(() {
              ischecked_1 = value!;
            });
          },
        ),
        Text(
          'i_agree'.tr(),
          style: TextStyles.textstyle12,
        ),
        SizedBox(
          width: 4.w,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomeView(),
              ),
            );

            // RouteUtils.navigateTo(const NewLoginScreenView());
          },
          child: Text("terms_and_conditions".tr(),
              style: TextStyles.textstyle12.copyWith(color: kPrimaryColor)),
        ),
      ],
    );
  }
}
