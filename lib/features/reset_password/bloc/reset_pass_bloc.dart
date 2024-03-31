// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/home/views/home_view.dart';
import 'package:kian_sheeps_projects/features/reset_password/repo/reset_pass_repo.dart';
import 'package:kian_sheeps_projects/features/verify_code/verify_code_bloc/verify_code_bloc.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:kian_sheeps_projects/helper/show_snack_bar.dart';

class ResetPasswordBLoc extends Bloc<AppEvent, AppState> {
  ResetPasswordBLoc() : super(Start()) {
    on<Click>(resetPassword);
  }
  static ResetPasswordBLoc get(context) => BlocProvider.of(context);
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var verifyCode = VerifyCodeBLoc.get(RouteUtils.context).code.text;
///////////////////////////////////////////////////////////////////////////////////
///////////////////////////////   METHODS     /////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
  resetPassword(AppEvent event, Emitter<AppState> emit) async {
    if (!formkey.currentState!.validate()) return;

    emit(Loading());
    Map<String, dynamic> body = {
      "code": verifyCode,
      "password": password.text,
      "password_confirmation": confirmPassword.text
    };

    try {
      Response response =
          await ResetPasswordRepository.resetPasword(body: body);
      if (response.statusCode == 200) {
        emit(Done());
        log(response.statusCode.toString());
        RouteUtils.navigateAndPopAll(HomeView());

        log("password Has been reset");
      } else {
        emit(Error());
        showSnackBar(RouteUtils.context,
            "catch an error ==>${response.statusCode.toString()}");

        log(response.statusCode.toString());

        log("Failed to reset the pass");
      }
    } catch (e) {
      emit(Error());
      showSnackBar(RouteUtils.context, "catch an error ==>$e");

      log("Catch an error => ${e.toString()}");
    }
  }
}
