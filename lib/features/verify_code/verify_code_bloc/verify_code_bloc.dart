// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kian_sheeps_projects/core/AppStorage.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/forget_password/repo/forget_password_repo.dart';
import 'package:kian_sheeps_projects/features/login/views/login_screen_view.dart';
import 'package:kian_sheeps_projects/features/reset_password/views/reset_password_screen_view.dart';
import 'package:kian_sheeps_projects/features/verify_code/repo/verify_code_repo.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:kian_sheeps_projects/helper/show_snack_bar.dart';

class VerifyCodeBLoc extends Bloc<AppEvent, AppState> {
  VerifyCodeBLoc() : super(Start()) {
    on<Click>(verifyCode);
    on<ResendCode>(_resendCode);
    on<Reset>((event, emit) => emit(Start()));
  }
  static VerifyCodeBLoc get(context) => BlocProvider.of(context);
  TextEditingController code = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  verifyCode(Click event, Emitter<AppState> emit) async {
    if (!formkey.currentState!.validate()) return;
    emit(Loading());
    Map<String, dynamic> body = {
      "user_id": AppStorage.getUserId,
      "code": code.text,
    };
    try {
      Response response = await VerifyCodeRepository.verifyCode(body: body);
      GetStorage().write('reset_pass_code', response.data["data"]["code"]);

      if (response.statusCode == 200) {
        emit(Done());
        // AppStorage.cacheToken(response.data['data']['isVerified']);

        if (event.arguments == true) {
          RouteUtils.navigateTo(const LoginScreenView());
        } else {
          RouteUtils.navigateTo(
            const ResetPasswordScreenView(),
          );
        }
      } else {
        log("Error ${response.statusCode}");
        showSnackBar(RouteUtils.context, "ERROR : ${response.data['message']}");
        log("Failed to Verify the code");
        emit(Error());
      }
    } catch (e) {
      emit(Error());
      showSnackBar(RouteUtils.context, "catch an error ==>$e");

      log("Catch an error => ${e.toString()}");
    }
  }

  _resendCode(AppEvent event, Emitter<AppState> emit) async {
    // if (!formKey.currentState!.validate()) return;
    emit(Loading());
    String body = GetStorage().read('email');
    // String body = LoginBloc.get(RouteUtils.context).emailOrPhone.text;
    try {
      Response response = await ForgetPasswordRepo.sendCode(body: body);
      if (response.statusCode == 200) {
        log("Done ${response.statusCode}");
        AppStorage.cacheId(response.data['user_id']);
        emit(Done());
      } else {
        log("Error ${response.statusCode}");
        showSnackBar(
          RouteUtils.context,
          response.data['message'],
        );

        emit(Error());
      }
    } catch (e) {
      log("error from the catch part: $e");
      showSnackBar(RouteUtils.context, "catch an error ==>$e");
    }
  }
}
