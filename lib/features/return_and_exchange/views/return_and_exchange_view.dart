import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/return_and_exchange/widgets/exchange_questions_item.dart';
import 'package:kian_sheeps_projects/generated/l10n.dart';
import 'package:kian_sheeps_projects/helper/app_bar_method.dart';

class ReturnAndExchange extends StatefulWidget {
  const ReturnAndExchange({super.key});

  @override
  State<ReturnAndExchange> createState() => _ReturnAndExchangeState();
}

class _ReturnAndExchangeState extends State<ReturnAndExchange> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context: context, title: S.of(context).return_and_exchange),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      const ExchangeQuestionsItem(),
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
