import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/reset_password/repo/reset_pass_repo.dart';
import 'package:kian_sheeps_projects/features/verify_code/verify_code_bloc/verify_code_bloc.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';

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

        log("password Has been reset");
      } else {
        emit(Error(
            "Reset pass Failed  with status code ==> ${response.statusCode.toString()}"));

        log(response.statusCode.toString());

        log("Failed to reset the pass");
      }
    } catch (e) {
      emit(Error("catch an error ===> ${e.toString()}"));

      log("Catch an error => ${e.toString()}");
    }
  }
}
