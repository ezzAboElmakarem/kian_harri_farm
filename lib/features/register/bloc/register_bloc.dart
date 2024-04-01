// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/home/views/home_view.dart';
import 'package:kian_sheeps_projects/features/register/repo/register_repo.dart';
import 'package:kian_sheeps_projects/features/verify_code/views/vrefiy_code_view.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:kian_sheeps_projects/helper/show_snack_bar.dart';

class RegisterBloc extends Bloc<AppEvent, AppState> {
  RegisterBloc() : super(Start()) {
    on<Click>(_addUser);
  }

  static RegisterBloc get(context) => BlocProvider.of(context);

  // static SignupBloc get instance =>
  //     BlocProvider.of<SignupBloc>(RouteUtils.context);
  late final GetStorage _storage;

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
      print("the user Id is **********${response.data["data"]["user_id"]}");
      print("the code is **********${response.data["data"]["code"]}");
      String userId = response.data["data"]["user_id"].toString();
      String code = response.data["data"]["code"].toString();

      GetStorage().write('user_id', userId);
      GetStorage().write('code', code);
      if (response.statusCode == 200) {
        emit(Done());
        RouteUtils.navigateAndPopAll(const VerfiyCodeScreenView(
          isRegister: true,
        ));

        log("name => ${body["name"]}");
      } else {
        emit(Error());
        log('error name  ${body["name"]}');
        showSnackBar(RouteUtils.context,
            "catch an error ==>${response.statusCode.toString()}");
      }
    } catch (e) {
      emit(Error());
      showSnackBar(RouteUtils.context, "catch an error ==>$e");

      log(e.toString());
    }
  }
}
