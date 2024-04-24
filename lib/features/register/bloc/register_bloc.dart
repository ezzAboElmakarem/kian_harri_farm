// ignore_for_file: use_build_context_synchronously, unused_field

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kian_sheeps_projects/core/AppStorage.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/register/repo/register_repo.dart';
import 'package:kian_sheeps_projects/features/verify_code/views/vrefiy_code_view.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:kian_sheeps_projects/helper/show_snack_bar.dart';

class RegisterBloc extends Bloc<AppEvent, AppState> {
  RegisterBloc() : super(Start()) {
    on<Click>(_addUser);
    on<Reset>((event, emit) => emit(Start()));
  }

  static RegisterBloc get(context) => BlocProvider.of(context);

  // static SignupBloc get instance =>
  //     BlocProvider.of<SignupBloc>(RouteUtils.context);

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirmation = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  //============================================================================
  //============================================================================  Functions
  //============================================================================

  _addUser(AppEvent event, Emitter<AppState> emit) async {
    if (!formkey.currentState!.validate()) return;

    emit(Loading());
    Map<String, dynamic> body = {
      "name": name.text,
      "email": email.text,
      "phone": phone.text,
      "password": password.text,
      "password_confirmation": passwordConfirmation.text,
    };
    try {
      Response response = await SignupRepository.signUp(body: body);
      log("response => $response");
      log(response.statusCode.toString());

      String userId = response.data["data"]["user_id"].toString();
      String code = response.data["data"]["code"].toString();

      GetStorage().write('user_id', userId);
      GetStorage().write('code', code);
      GetStorage().write('email', email.text);
      if (response.statusCode == 200) {
        emit(Done());
        AppStorage.cacheId(response.data["data"]["user_id"]);

        // AppStorage.cacheToken(response.data['data']['token']);

        RouteUtils.navigateAndPopAll(const VerfiyCodeScreenView(
          isVerified: true,
        ));

        log("name => ${body["name"]}");
      } else if (response.statusCode == 422) {
        emit(Error());
        log('error name  ${body["name"]}');
        showSnackBar(RouteUtils.context, "ERROR : ${response.data['message']}");
      } else {
        emit(Error());
        log('error name  ${body["name"]}');
        showSnackBar(RouteUtils.context, "ERROR : ${response.data['message']}");
      }
    } catch (e) {
      emit(Error());
      showSnackBar(RouteUtils.context, "catch an error ==>$e");

      log(e.toString());
    }
  }
}
