// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/home/views/home_view.dart';
import 'package:kian_sheeps_projects/features/reset_password/views/reset_password_screen_view.dart';
import 'package:kian_sheeps_projects/features/verify_code/repo/verify_code_repo.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:kian_sheeps_projects/helper/show_snack_bar.dart';

class VerifyCodeBLoc extends Bloc<AppEvent, AppState> {
  VerifyCodeBLoc() : super(Start()) {
    on<Click>(verifyCode);
  }
  static VerifyCodeBLoc get(context) => BlocProvider.of(context);
  TextEditingController code = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  verifyCode(Click event, Emitter<AppState> emit) async {
    if (!formkey.currentState!.validate()) return;
    emit(Loading());
    Map<String, dynamic> body = {
      "user_id": GetStorage().read('user_id'),
      "code": code.text,
    };
    try {
      Response response = await VerifyCodeRepository.verifyCode(body: body);
      if (response.statusCode == 200) {
        emit(Done());
        if (event.arguments == true) {
          RouteUtils.navigateAndPopAll(HomeView());
        } else {
          RouteUtils.navigateAndPopAll(const ResetPasswordScreenView());
        }

        log(response.statusCode.toString());

        log("Code Has been Verified");
      } else {
        emit(Error());
        showSnackBar(RouteUtils.context, " ${response.data['message']}");

        log("Failed to Verify the code");
        log("there is an error with status code : ${response.statusCode}");
      }
    } catch (e) {
      emit(Error());
      showSnackBar(RouteUtils.context, "catch an error ==>$e");

      log("Catch an error => ${e.toString()}");
    }
  }
}
