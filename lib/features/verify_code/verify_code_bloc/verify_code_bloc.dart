import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/verify_code/repo/verify_code_repo.dart';

class VerifyCodeBLoc extends Bloc<AppEvent, AppState> {
  VerifyCodeBLoc() : super(Start()) {
    on<Click>(verifyCode);
  }
  static VerifyCodeBLoc get(context) => BlocProvider.of(context);
  TextEditingController code = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  verifyCode(Click event, Emitter<AppState> emit) async {
    emit(Loading());
    Map<String, dynamic> body = {
      "user_id": "6",
      "code": code.text,
    };
    try {
      Response response = await VerifyCodeRepository.verifyCode(body: body);
      if (response.statusCode == 200) {
        emit(Done());
        log(response.statusCode.toString());

        log("Code Has been Verified");
      } else {
        emit(Error());
        log(response.statusCode.toString());

        log("Failed to Verify the code");
      }
    } catch (e) {
      log("Catch an error => ${e.toString()}");
    }
  }
}
