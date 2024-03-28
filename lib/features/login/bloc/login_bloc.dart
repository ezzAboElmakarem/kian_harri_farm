import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/login/repo/login_repo.dart';

class LoginBloc extends Bloc<AppEvent, AppState> {
  LoginBloc() : super(Start()) {
    on<Click>(_login);
  }
  ////////////////////////////////////////////////////////////////////////
  ///  ////////////////////////////////////////////////////////////////////////
  ///   ///////////////////////////////   VARIBLES        /////////////////////////////////////////
  ///  ////////////////////////////////////////////////////////////////////////
  static LoginBloc get(context) => BlocProvider.of(context);
  TextEditingController emailOrPhone = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  ////////////////////////////////////////////////////////////////////////
  ///  ////////////////////////////////////////////////////////////////////////
  ///   ///////////////////////////////   METHODS        /////////////////////////////////////////
  ///  ////////////////////////////////////////////////////////////////////////

  _login(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    Map<String, dynamic> body = {
      "data": emailOrPhone.text,
      "password": password.text,
    };
    try {
      Response response = await LoginRepo.login(body: body);
      log("response => $response");
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        emit(Done());
        log(response.statusCode.toString());
        log("login success welcome > ${response.data}");
      } else {
        emit(Error());
        log(response.statusCode.toString());
        log("login error the data is ==> ${response.data}");
      }
    } catch (e) {
      emit(Error());
      log(e.toString());
      log("catch an error ");
    }
  }
}
