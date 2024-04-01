// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/home/models/home_model/home_model.dart';
import 'package:kian_sheeps_projects/features/home/repos/home_repo.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:kian_sheeps_projects/helper/show_snack_bar.dart';

class HomeBloc extends Bloc<AppEvent, AppState> {
  HomeBloc() : super(Start()) {
    on<Get>(getData);
  }
  static HomeBloc get(context) => BlocProvider.of(context);
  HomeModel? homeModel;

  getData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await HomeRepo.getData();
      if (response.statusCode == 200) {
        homeModel = HomeModel.fromJson(response.data);
        log('Get data Successfuly ');
        log(homeModel!.data!.category![0].toString());
        emit(Done());
      } else {
        emit(Error());
        showSnackBar(RouteUtils.context,
            "catch an error ==>${response.statusCode.toString()}");
        log('Get data Failed with Status code ${response.statusCode}');
      }
    } catch (e) {
      emit(Error());
      showSnackBar(RouteUtils.context, "catch an error ==>$e");
      log("catch error in get data ${e.toString()}");
    }
  }
}
