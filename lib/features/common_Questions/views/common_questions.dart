import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/common_Questions/bloc/common_ques_bloc.dart';
import '../../../widgets/questions_item.dart';
import '../../../helper/app_bar_method.dart';

class CommonQuestions extends StatelessWidget {
  const CommonQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          customAppBar(context: context, title: "common_questions_title".tr()),
      body: BlocBuilder<CommonQuestionsBloc, AppState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Error) {
            return Center(child: Text('error_getting_data'.tr()));
          } else if (state is Done) {
            var bloc = CommonQuestionsBloc.get(context);
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    ListView.separated(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => QuestionsItem(
                              answer: bloc.commonQuestionsData.data?[index]
                                      .answer ??
                                  'test question',
                              question: bloc.commonQuestionsData.data?[index]
                                      .question ??
                                  'test answer',
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 14.h,
                            ),
                        itemCount: bloc.commonQuestionsData.data?.length ?? 0)
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
