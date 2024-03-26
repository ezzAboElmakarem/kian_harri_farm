import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/questions_item.dart';
import '../../../helper/app_bar_method.dart';

class CommonQuestions extends StatelessWidget {
  const CommonQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          customAppBar(context: context, title: "common_questions_title".tr()),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => const QuestionsItem(),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 14.h,
                      ),
                  itemCount: 6)
            ],
          ),
        ),
      ),
    );
  }
}
