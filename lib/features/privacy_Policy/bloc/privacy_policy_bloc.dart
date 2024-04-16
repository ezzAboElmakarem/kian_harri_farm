// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/privacy_Policy/model/privacy_policy_model.dart';
import 'package:kian_sheeps_projects/features/privacy_Policy/repo/privacy_policy_repo.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:kian_sheeps_projects/helper/show_snack_bar.dart';

class PrivacyPolicyBloc extends Bloc<AppEvent, AppState> {
  PrivacyPolicyBloc() : super(Loading()) {
    on<Get>(getData);
  }
  static PrivacyPolicyBloc get(context) => BlocProvider.of(context);
  PrivacyPolicyModel privacyPolicyData = PrivacyPolicyModel();

  getData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await PrivacyPolicyRepository.getPrivacyPolicy();
      if (response.statusCode == 200) {
        privacyPolicyData = PrivacyPolicyModel.fromJson(response.data);
        log('Get privacy policy data Successfuly ');
        emit(Done());
      } else {
        emit(Error());
        showSnackBar(RouteUtils.context, " ${response.data['message']}");
        log('Get privacy policy data Failed with Status code ${response.statusCode}');
      }
    } catch (e) {
      emit(Error());
      showSnackBar(RouteUtils.context, "catch an error ==>$e");
      log("catch error in get privacy policy data ${e.toString()}");
    }
  }
}
