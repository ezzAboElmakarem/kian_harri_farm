import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/register/repo/register_repo.dart';

class RegisterBloc extends Bloc<AppEvent, AppState> {
  RegisterBloc() : super(Start()) {
    on<Click>(_addUser);
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
      if (response.statusCode == 200) {
        emit(Done());
        log("name => ${body["name"]}");
      } else {
        emit(Error());
        log('error name  ${body["name"]}');
      }
    } catch (e) {
      emit(Error());
      log(e.toString());
      log(body["phone"]);
    }
  }
}
