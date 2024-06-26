import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../helper/color_styles.dart';
import '../../../helper/text_styles.dart';
import 'register_forms.dart';

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
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const RegisterForms(),
              ),
            );

            // RouteUtils.navigateTo(const NewLoginScreenView());
          },
          child: Text("الشروط الاحكام",
              style: TextStyles.textstyle12.copyWith(color: kPrimaryColor)),
        ),
        SizedBox(
          width: 4.w,
        ),
        Text(
          "اوافق علي",
          style: TextStyles.textstyle12,
        ),
        Checkbox(
          activeColor: kPrimaryColor,
          value: ischecked_1,
          onChanged: (value) {
            setState(() {
              ischecked_1 = value!;
            });
          },
        ),
      ],
    );
  }
}
