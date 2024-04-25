import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/return_and_exchange/bloc/exchange_policy_bloc.dart';
import '../../../widgets/questions_item.dart';
import '../../../helper/app_bar_method.dart';

class ReturnAndExchange extends StatefulWidget {
  const ReturnAndExchange({super.key});

  @override
  State<ReturnAndExchange> createState() => _ReturnAndExchangeState();
}

class _ReturnAndExchangeState extends State<ReturnAndExchange> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: "return_and_exchange".tr()),
      body: BlocBuilder<ExchangePolicyBloc, AppState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Error) {
            return Center(child: Text('error_getting_data'.tr()));
          } else if (state is Done) {
            var bloc = ExchangePolicyBloc.get(context);
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    ListView.separated(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => QuestionsItem(
                              question: bloc.exchangePolicyData.data?[index]
                                      .question ??
                                  'test question',
                              answer:
                                  bloc.exchangePolicyData.data?[index].answer ??
                                      'test answer',
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 14.h,
                            ),
                        itemCount: bloc.exchangePolicyData.data?.length ?? 0)
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
