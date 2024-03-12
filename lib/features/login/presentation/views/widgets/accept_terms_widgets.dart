import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/constants.dart';
import 'package:kian_sheeps_projects/core/utlis/component.dart';
import 'package:kian_sheeps_projects/core/utlis/styles.dart';
import 'package:kian_sheeps_projects/features/login/presentation/views/new_login_screen_view.dart';

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
            navigateTo(context: context, widget: const NewLoginScreenView());
          },
          child: Text("الشروط الاحكام",
              style: Styles.textstyle12.copyWith(color: kPrimaryColor)),
        ),
        SizedBox(
          width: 4.w,
        ),
        Text(
          "اوافق علي",
          style: Styles.textstyle12,
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
