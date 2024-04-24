// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/AppStorage.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/update_profile/model/update_profile_model.dart';
import 'package:kian_sheeps_projects/features/update_profile/repo/update_profile_repo.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:kian_sheeps_projects/helper/show_snack_bar.dart';

class UpdateProfileBloc extends Bloc<AppEvent, AppState> {
  UpdateProfileBloc() : super(Loading()) {
    on<Get>(getData);
    on<Click>(updateData);
  }
  static UpdateProfileBloc get(context) => BlocProvider.of(context);

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  UpdateProfileModel userData = UpdateProfileModel();

  getData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await UpdateProfileRepo.getData();
      if (response.statusCode == 200) {
        userData = UpdateProfileModel.fromJson(response.data);
        AppStorage.cacheUser(userData);
        log('Get  user data Successfuly ');
        log(userData.data!.email.toString());
        // log(userData.data!.name.toString());

        emit(Done());
      } else {
        if ("${response.data['message']}" == "Unauthenticated.") {
          emit(Empty());
        } else {
          emit(Error());
          showSnackBar(
              RouteUtils.context, "ERROR : ${response.data['message']}");
          log('Get user data Failed with Status code ${response.statusCode}');
        }
      }
    } catch (e) {
      emit(Error());
      showSnackBar(RouteUtils.context, "catch an error ==>$e");
      log("catch error in get user data ${e.toString()}");
    }
  }

  updateData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    userData = AppStorage.getUserModel;
    Map<String, dynamic> data = {
      "name": name.text.isEmpty ? userData.data!.name.toString() : name.text,
      "email":
          email.text.isEmpty ? userData.data!.email.toString() : email.text,
      "phone":
          phone.text.isEmpty ? userData.data!.phone.toString() : phone.text,
      // "password": password.text,
    };
    try {
      Response response = await UpdateProfileRepo.updateData(data: data);
      if (response.statusCode == 200) {
        showSnackBar(RouteUtils.context, "Update Data Successfully");
        log('update  user data Successfuly ');
        log(response.data!.toString());
        emit(Done());
      } else {
        emit(Error());
        showSnackBar(RouteUtils.context, " ${response.data['message']}");
        log('update user data Failed with Status code ${response.statusCode}');
      }
    } catch (e) {
      emit(Error());
      showSnackBar(RouteUtils.context, "catch an error ==>$e");
      log("catch error in update user data ${e.toString()}");
    }
  }
}
