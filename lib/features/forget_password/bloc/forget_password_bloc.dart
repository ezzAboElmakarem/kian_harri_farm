// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/forget_password/repo/forget_password_repo.dart';
import 'package:kian_sheeps_projects/features/verify_code/views/vrefiy_code_view.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:kian_sheeps_projects/helper/show_snack_bar.dart';

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
    if (!formkey.currentState!.validate()) return;

    emit(Loading());
    String body = emailOrPhone.text;
    try {
      Response response = await ForgetPasswordRepo.sendCode(body: body);
      if (response.statusCode == 200) {
        emit(Done());

        RouteUtils.navigateAndPopAll(const VerfiyCodeScreenView());

        log("Code Has been sending");
      } else {
        emit(Error());
        showSnackBar(RouteUtils.context,
            "Failed to send the code ==>${response.statusCode.toString()}");

        log(response.statusCode.toString());
      }
    } catch (e) {
      emit(Error());
      showSnackBar(RouteUtils.context, "catch an error ==>$e");

      log("Catch an error => ${e.toString()}");
    }
  }
}
