import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/forget_password/repo/forget_password_repo.dart';

class ForgetPasswordBLoc extends Bloc<AppEvent, AppState> {
  ForgetPasswordBLoc() : super(Start()) {
    on<Click>(sendCode);
  }

  static ForgetPasswordBLoc get(context) => BlocProvider.of(context);
  TextEditingController emailOrPhone = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

///////////////////////////////////////////////////////////////
/////////////////////////////    METHODS                   ///////////////////////////////
////////////////////////////////////////////
  sendCode(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    String body = emailOrPhone.text;
    try {
      Response response = await ForgetPasswordRepo.sendCode(body: body);
      if (response.statusCode == 200) {
        emit(Done());
        log(response.statusCode.toString());

        log("Code Has been sending");
      } else {
        emit(Error());
        log(response.statusCode.toString());

        log("Failed to send the code");
      }
    } catch (e) {
      log("Catch an error => ${e.toString()}");
    }
  }
}
