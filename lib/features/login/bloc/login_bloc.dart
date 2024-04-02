// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/AppStorage.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/home/views/home_view.dart';
import 'package:kian_sheeps_projects/features/login/repo/login_repo.dart';
import 'package:kian_sheeps_projects/features/verify_code/views/vrefiy_code_view.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:kian_sheeps_projects/helper/show_snack_bar.dart';

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
    if (!formkey.currentState!.validate()) return;

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
        AppStorage.cacheToken(response.data['data']['token']);
        RouteUtils.navigateAndPopAll(HomeView());
        log("login success welcome > ${response.data}");
      } else {
        emit(Error());
        showSnackBar(RouteUtils.context, "ERROR : ${response.data['message']}");

        if (response.data['isVerified'] == 0) {
          RouteUtils.navigateTo(const VerfiyCodeScreenView());
        }
      }
    } catch (e) {
      emit(Error());
      showSnackBar(RouteUtils.context, '"catch an error ==>$e"');

      log(e.toString());
      log("catch an error ");
    }
  }
}
