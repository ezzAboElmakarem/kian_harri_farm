// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/common_Questions/model/common_ques_model.dart';
import 'package:kian_sheeps_projects/features/common_Questions/repo/common_ques_repo.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:kian_sheeps_projects/helper/show_snack_bar.dart';

class CommonQuestionsBloc extends Bloc<AppEvent, AppState> {
  CommonQuestionsBloc() : super(Loading()) {
    on<Get>(getData);
  }
  static CommonQuestionsBloc get(context) => BlocProvider.of(context);
  CommonQuestionsModel commonQuestionsData = CommonQuestionsModel();

  getData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await CommonQurestionsRepository.getData();
      if (response.statusCode == 200) {
        commonQuestionsData = CommonQuestionsModel.fromJson(response.data);
        log('Get Common ques data Successfuly ');
        emit(Done());
      } else {
        emit(Error());
        showSnackBar(RouteUtils.context, " ${response.data['message']}");
        log('Get Common ques data Failed with Status code ${response.statusCode}');
      }
    } catch (e) {
      emit(Error());
      showSnackBar(RouteUtils.context, "catch an error ==>$e");
      log("catch error in get Common ques data ${e.toString()}");
    }
  }
}
